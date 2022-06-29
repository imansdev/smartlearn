<template>
  <div>
    <b-card
      no-body
      class="overflow-hidden imanlgk"
      style="max-width: 100%; max-height: 200px;"
    >
      <b-row no-gutters>
        <b-col md="4">
          <b-card-img
            style="width: 350px; height: 200px;"
            :src="course.image"
            
            :alt="`${course.name} image`"
            class="rounded-1 img-fluid"
          ></b-card-img>
        </b-col>
        <b-col md="8">
          <b-row>
            <b-card-body :title="course.name">
              <b-card-text>
                {{course.description}}
              </b-card-text>
            </b-card-body>
          </b-row>
          <b-row>
            <b-col md="7"
              ><b-row><b-button>detail</b-button></b-row></b-col
            >
          </b-row>
          <b-row>
            <b-card-sub-title class="py-3 text-center">
              {{ course.deadline }} weeks | {{ course.languageTo }}
            </b-card-sub-title>
          </b-row>
        </b-col>
      </b-row>
    </b-card>
  </div>
</template>

<script>
export default {
  props: { course: Object },
};
</script>

<style>
.imanlgk {
  box-shadow: -10px 10px 20px #0c0c0b;
}
.righ {
  text-align: right;
}
</style>
