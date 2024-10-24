import jenkins.model.*
import hudson.security.*

// Get Jenkins instance
def instance = Jenkins.getInstance()
def realm = new HudsonPrivateSecurityRealm(false)

// Create/Update the user
realm.createAccount("randomname","randompassword")
instance.setSecurityRealm(realm)

// Save the Jenkins instance configuration
instance.save()

println("Password updated successfully for user: admin")