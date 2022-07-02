<template>
  <div>
    {{course.name}}
    <!-- {{courseId}} -->
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      courseId: this.$route.params.id,
      course: {},
    };
  },
  methods: {
    navigateToHome() {
      this.$router.push({ path: "/" });
    }
  },
  async created() {
    try {
      const response = await axios.get(`http://127.0.0.1:8000/api/v1/courses/${this.courseId}`);
      this.course = response.data;
    } catch (e) {
      this.errors.push(e);
    }
  },
};
</script>

<style></style>
