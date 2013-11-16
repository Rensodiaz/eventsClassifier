package deleteme

import twitter4j.*
import weka.clusterers.*;
import weka.core.*;
import weka.core.converters.ConverterUtils.DataSource;


class TwitterLoginController {

    def twitterService

    def index = {}

    def login = {
        redirect url: twitterService.authenticate("http://localhost:8080/deleteme/twitterLogin/callback") // [1]
    }

    def callback = {
        if (params.denied){
            flash.message = "Permiso denegado"

        } else {
            Usuario usuario = checkTwitterUser(twitterService.verifyCredentials(params.oauth_verifier))
            session.user = usuario
        }
        redirect(action: "inicio");
    }

    private checkTwitterUser(User twitterUser) {
        Usuario user = Usuario.findByTwitterId(twitterUser.id);
        //Usuario twits = twitterUser.fin

        if (!user) {
            user = new Usuario(twitterId: twitterUser.id);
        }

        user.name = twitterUser.name
        user.screenName = twitterUser.screenName
        user.profileImg = twitterUser.profileImageURL.toString();
        user.twits = 3;

        user.save()
    }
    def getTwits(){
        def getcls;
        getcls = twitterService.obtenerRetweet();
        [twits: getcls];
    }

    def insertDatoInModelRetweet(){

        def twitterRetweet = twitterService.obtenerRetweet();
        DataSource modelo = new DataSource("C:/retweets.arff");
        Instances train = modelo.getDataSet();

        for(int i=0; i<train.numInstances();i++){
            def id = train.instance(i).value(0);

            if (twitterService.getUserID()==id){
                train.delete(i);
                break;
            }
        }
        double[] attributos = new double [train.numAttributes()];
        attributos[0]= twitterService.getUserID();
        for (int i=1;i<train.numAttributes();i++){

             if (twitterRetweet.containsKey(train.attribute(i).name()))
             {
                 attributos[i]=1;
             }
             else
             {
                 attributos[i]=0;
             }
        }
        Instance instaciada = new Instance(0,attributos);
       // println(instaciada);
        train.add(instaciada);
        return modelo;
    }

    def inicio(){

    }

    def insertDatoInModelHashTags(){

        def twitterHashtags = twitterService.obtenerHashtags();
        DataSource modelo = new DataSource("C:/hashtags.arff");
        Instances train = modelo.getDataSet();

        for(int i=0; i<train.numInstances();i++){
            def id = train.instance(i).value(0);

            if (twitterService.getUserID()==id){
                train.delete(i);
                break;
            }
        }
        double[] attributos = new double [train.numAttributes()];
        attributos[0]= twitterService.getUserID();
        for (int i=1;i<train.numAttributes();i++){

            if (twitterHashtags.containsKey(train.attribute(i).name()))
            {
                attributos[i]=twitterHashtags.get(train.attribute(i).name());
            }
            else
            {
                attributos[i]=0;
            }
        }
        Instance instaciada = new Instance(0,attributos);
        train.add(instaciada);
        return modelo;
    }
    def closterizarModelHashtags(){

        def usersData = [];
        SimpleKMeans kmeans = new SimpleKMeans();
        kmeans.setSeed(10);

        DataSource source = insertDatoInModelHashTags();
        Instances train = source.getDataSet();
        // This is the important parameter to set
        kmeans.setPreserveInstancesOrder(true);
        kmeans.setDisplayStdDevs(false);

        kmeans.setNumClusters(50);
        kmeans.setDistanceFunction(new HashtagDistance());
        kmeans.buildClusterer(train);

        // This array returns the cluster number (starting with 0) for each instance
        // The array has as many elements as the number of instance

        int[] assignments = kmeans.getAssignments();
        Instances T=source.getDataSet();

        int mycluster= assignments[assignments.length-1];
        def usuarios=[];
        for(int i=0;i<assignments.length;i++) {
               if (assignments[i]==mycluster)
               {
                     usuarios.add(T.instance(i).value(0).longValue());
               }
        }
        def contador = 0;

        for(user in usuarios){

           if(contador == 15)
               break;
            else
                usersData.add(twitterService.procesarUsuarios(user));

            contador++;
        }


        [usersData:usersData]
       // println(usuarios);
        //println(T.numInstances());
    }

    def closterizarModelRetweets(){

        def usersData = [];
        SimpleKMeans kmeans = new SimpleKMeans();
        kmeans.setSeed(10);

        DataSource source = insertDatoInModelRetweet();
        Instances train = source.getDataSet();
        // This is the important parameter to set
        kmeans.setPreserveInstancesOrder(true);
        kmeans.setDisplayStdDevs(false);

        kmeans.setNumClusters(20);
        kmeans.setDistanceFunction(new RetweetDistance());
        kmeans.buildClusterer(train);

        // This array returns the cluster number (starting with 0) for each instance
        // The array has as many elements as the number of instance

        int[] assignments = kmeans.getAssignments();
        Instances T=source.getDataSet();

        int mycluster= assignments[assignments.length-1];
        def usuarios=[];
        for(int i=0;i<assignments.length;i++) {
            if (assignments[i]==mycluster)
            {
                usuarios.add(T.instance(i).value(0).longValue());
            }
        }
        def contador = 0;

        for(user in usuarios){

            if(contador == 15)
                break;
            else
                usersData.add(twitterService.procesarUsuarios(user));

            contador++;
        }
        [usersData:usersData]
    }

    def visualizarUsuario(){
       def idUsuario= params.long("idUsuario");
       [usuario: twitterService.procesarUsuarios(idUsuario)];
    }

    def logout = {

        session.invalidate()
        redirect action: index
    }

    def procesandoSeguirUsuario(long idUsuario, String requestFrom) {

        if (twitterService.seguirUsuario(idUsuario)){
            flash.validacion = true;
            flash.mensajeValidacion = "Usuario seguido extisosamente";
        } else {
            flash.validacion = false;
            flash.mensajeValidacion = "Ya esta siguiendo a este usuario"
        }

        if(requestFrom == "visualizarUsuario" ){
           // flash.mensajeValidacion = "Usuario seguido exitosamente.";
            redirect(action: "visualizarUsuario", params: [idUsuario: idUsuario]);
        }   else {
           // flash.mensajeValidacion = "Usuario seguido exitosamente.";
            redirect(action: "closterizarModelHashtags");
        }
        //render "$idUsuario y $requestFrom";

    }
}