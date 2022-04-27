<template>
  <div class="contentHome">
    

  <user-detail></user-detail>

  </div>


</template>
<script>
import UserDetail from '../components/UserDetail.vue';
export default {
  components: { UserDetail },
  name: "home"
};
</script>




<style >

.contentHome{
  align-content: center;
  align-items: center;
  padding: auto;
  margin-left: 30%;
}



</style>
  