<template>
  <div>
    <div>
      <Header />
    </div>
    <div class="  container" id="grad1" style="padding: 50px; min-width: 100%;">
      <!-- <div class="b"> -->
        <!-- <div class="c"> -->
          <router-view></router-view>
        <!-- </div> -->
      <!-- </div> -->
    </div>
  </div>
</template>

<script>
import Header from "./components/Header.vue";

export default {
  name: "app",
  components: {
    Header,
  },
};
</script>
<style>
/* .a{
  position: fixed;
  inset: 0 -50% 0 -50%;
  animation: slide 3s ease-in-out infinite alternate;
  background-image: linear-gradient(60deg, #6c3 50%, #09f 50%);
  opacity: .5;
}
.b{
  animation-direction: alternate-reverse;
  animation-duration: 4s;
}
.c{
  animation-duration: 5s;
}
@keyframes slide {
  0% {transform: translateX(-25%);}
  100% {transform: translateX(25%);}
} */
#grad1 {
  /* width: ; */
  /* min-width: 1000px; */
  background-color: white; /* For browsers that do not support gradients */
  background-image: linear-gradient(black, white);
}
</style>
