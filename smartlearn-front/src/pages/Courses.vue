<template>
  <div class="container">
    <b-row>
      <h1 class="title colortitel">courses</h1>
      <b-col xl="12" sm="12" md="12" lg="12">
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
  async created() {
    try {
      const response = await axios.get(`http://127.0.0.1:8000/api/v1/courses`);
      this.courses = response.data;
    } catch (e) {
      this.errors.push(e);
    }
  },
};
</script>

<style>
.colortitel {
  color: #fcd200da;
  text-shadow: -1.5px 1.5px 2px #fcd200da;
}
</style>
