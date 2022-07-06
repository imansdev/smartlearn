<!-- <template>
  <div>
    <b-button v-b-toggle.sidebar-1>Toggle Sidebar</b-button>
    <b-sidebar id="sidebar-1" title="Sidebar">
      <div class="px-3 py-2">
        <p>
          Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis
          in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
        </p>
        <b-img src="https://picsum.photos/500/500/?image=54" fluid thumbnail></b-img>
      </div>
    </b-sidebar>
  </div>
</template> -->

<!-- <template>
  <div v-if="isDrizzleInitialized" id="app">    
    <div class="container py-3 my-4">
    

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

import { mapGetters } from "vuex";

export default {
  name: "app",
  components: {
    Courses,
  },

  computed: mapGetters("drizzle", ["isDrizzleInitialized"]),
  
};
</script>
 -->

<template >

  <div  class="container">
    <b-row>
    <h1 class="title">courses</h1>

    <b-col xl="12">
      <b-row v-for="course in courses" :key="course._id" class="py-3">
        <ExploreCourse :course="course" />
      </b-row>
    </b-col>
    </b-row>
  </div>

</template>

<script>
import axios from "axios";
import ExploreCourse from "../components/ExploreCourse.vue";

export default {
  components: { ExploreCourse },
  data() {
    return {
      courses: [],
      errors: [],
    };
  },
  // mounted () {
  //   this.get_Tasks();
  // },
  async created() {
    try {
      const response = await axios.get(`http://127.0.0.1:8000/api/v1/courses`);
      this.courses = response.data;
    } catch (e) {
      this.errors.push(e);
    }
  },
};
//   computed: {
//   courses() {
//     return this.allcourses
//   }
// },
// created() {
//   axios
//     .get("/api/v1/courses/")
//     .then(data => {
//       this.allcourses = data;

//     })
// this.$api.get('/courses')
// .then(data => {
//   this.allCourses = data
//   this.loading = false
// })

// },
// };
</script>

