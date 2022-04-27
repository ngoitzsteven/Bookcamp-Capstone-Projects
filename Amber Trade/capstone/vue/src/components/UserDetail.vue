<template>

  <div class="body">
    <img src= '../images/Profilepic.png' id="profile-placeholder" />


        <h1>WELCOME BACK {{profile.username}}!</h1>
          <h2> Below are details for your profile</h2>
            <ul>
              <li><b>Username:</b>  {{profile.username}}</li>
              <li><b>Access level:</b>  {{profile.role}}</li>
              <li><b>User Id:</b>  {{profile.userId}}</li>
             
            </ul>
           
  </div>
</template>

<script>



export default {
  name: "user-detail",
  
  data(){
    return {
      isLoading: true
    };
  },
  computed: {
    profile(){
      return this.$store.state.user;
    }
  }
  
  
};
</script>

<style scoped>
 .body{
  background:linear-gradient(to right, #96d9d9, #6969b3 );
  align-content: center;
  margin: auto;
  width: 60%;
  border: 1px solid grey;
  padding-right: 400px;
  text-align: center;
   padding: 40px; 
   margin-top: 50px; 
   margin-right: 500px; 
 }

 .body{
   padding: 50px;
   
 }
ul{
  display: block;
  list-style-type: none;

}
.content{
     margin: 0px 20px 0px 0px;
     padding: 0px 20px 0px 0px;
  width: 60%;
  border: 3px solid ;
  display: flex;
  text-align: center;
  display: block;
}
#profile-placeholder{
  width: 100px;
  border: 2px solid grey;
  display: inline;
}
</style>