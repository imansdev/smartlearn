<template>
  <div v-if="isDrizzleInitialized" id="app">    
    <div class="container py-3 my-4">
      <div class="row">
        <div class="col-lg-12 col-md-12">
          <h3>Add a Course</h3>
          <AddCourseForm />
        </div>
      </div>
       <div class="row">
        <div class="col-lg-12 col-md-12 ">
          <h3>SmartLearn</h3>
          <Courses />
        </div>
      </div>
      
    </div>
  </div>

  <div v-else>
    <p>Loading...</p>
    <p>
      Is <a href="https://metamask.io/" target="_blank">MetaMask</a> extension
      installed on your browser?
    </p>
    <p>
      Is proper network selected in MetaMask? (Rinkeby Test Network or Localhost
      on port 8545)
    </p>
  </div>
</template>

<script>
import Courses from "../components/Courses.vue";
import AddCourseForm from "../components/AddCourseForm.vue";
import { mapGetters } from "vuex";

export default {
  name: "app",
  components: {
    AddCourseForm,
    Courses,
  },

  computed: mapGetters("drizzle", ["isDrizzleInitialized"]),
  
};
</script>
