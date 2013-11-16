package deleteme

import org.codehaus.groovy.grails.commons.*
import twitter4j.*
import twitter4j.auth.*

class TwitterService {

    static transactional = false
    static scope = 'session'

    Twitter twitter
    RequestToken requestToken

    //method to Auth the user
    String authenticate(String returnUrl) {
        String consumerkey = "wtNcL0HyYMbvg9hTDLNJDw";
        String consumerSecret = "r1KpAOaauDooNoC73l9dSnB0aKWGRFRxoACBiHeoe8";
        twitter = new TwitterFactory().getInstance();
        twitter.setOAuthConsumer(consumerkey, consumerSecret)

        requestToken = twitter.getOAuthRequestToken(returnUrl)
        return requestToken.getAuthenticationURL()
    }

    User verifyCredentials(String oauth_verifier) {
        AccessToken accessToken = twitter.getOAuthAccessToken(requestToken, oauth_verifier)
        return twitter.verifyCredentials();
    }

    def getAllTwits(){

        def h =  twitter.getRetweetedByMe();
        def t = twitter.getUserTimeline();
        for(l in h){
            l.text
        }
    }

    def obtenerHashtags(){

        def Map<String,Integer> userhashtags = new HashMap<String, Integer>();

        for (Status tweet : twitter.getUserTimeline())
        {

            HashtagEntity[] tags = tweet.getHashtagEntities();
            for(HashtagEntity h : tags)
            {
                if(!userhashtags.containsKey(h.getText()))
                    userhashtags.put(h.getText(), 1);
                else
                    userhashtags.put(h.getText(),(Integer)userhashtags.get(h.getText()) +1);
            }
        }
        return userhashtags;
    }

    def obtenerRetweet(){

        def Map<Long,Integer> userretweet = new HashMap<String, Integer>();

        for (Status tweet : twitter.getUserTimeline())
        {
            Status S=tweet.getRetweetedStatus();
            if(S!=null)
            {
                if(!userretweet.containsKey(S.getUser().getId()))
                    userretweet.put(S.getUser().getId(), 1);
                else
                    userretweet.put(S.getUser().getId(),(Integer)userretweet.get(S.getUser().getId()) +1);
            }
        }
        return userretweet;
    }
    def getUserID(){
        return twitter.getId();
    }

    def procesarUsuarios(long usuario){

         return  twitter.showUser(usuario);

    }

    def seguirUsuario(long idUsuario) {

       if(twitter.existsFriendship(twitter.getId().toString(),idUsuario.toString())){
           return false;
       }
       else{
            twitter.createFriendship(idUsuario);
            return true;
       }
    }


}