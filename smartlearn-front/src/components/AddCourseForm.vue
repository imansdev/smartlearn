<template>
  <div v-if="isDrizzleInitialized">
    <div>
      <b-form inline class="row" @submit.prevent="onSubmit">
        <div class="col-sm-3">
          <b-form-input
            v-model="description"
            class="mb-2"
            placeholder="Course Description"
          ></b-form-input>
        </div>

        <div class="col-sm-2">
          <b-form-input
            v-b-popover.hover.bottom="'The minimum prize is 0.1 eth'"
            id="datepicker-valid"
            v-model="prize"
            :state="prize >= 0.1"
            class="mb-2"
            placeholder="prize amount"
            type="text"
          ></b-form-input>
          <i class="fa-brands fa-ethereum"></i>
        </div>

        <div class="col-sm-3">
          <b-form-input type="date" v-model="date" class="mb-2"></b-form-input>
        </div>

        <div class="col-sm-3">
          <b-form-input type="time" v-model="time" class="mb-2"></b-form-input>
        </div>

        <div class="col-sm-1">
          <b-button type="submit" variant="primary">Add</b-button>
        </div>
      </b-form>
    </div>
  </div>
  <div v-else>
    <p>Loading...</p>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import moment from "moment";

const args = {
  contractName: "SmartLearn",
  method: "add",
  methodArgs: ["_description", "_deadline"],
};

export default {
  name: "AddCourseForm",
  components: {},
  computed: {
    ...mapGetters("drizzle", ["drizzleInstance", "isDrizzleInitialized"]),
    ...mapGetters("accounts", ["activeAccount", "activeBalance"]),
  },
  methods: {
    onSubmit() {
      let timestamp = 0;
      if (
        this.date != "" &&
        this.time != "" &&
        this.prize >= 0.1 &&
        this.description.length >= 1
      ) {
        let datetimeString = this.date + " " + this.time;
        timestamp = moment(datetimeString, "YYYY-MM-DD HH:mm").unix();

        this.drizzleInstance.contracts[args.contractName].methods[
          args.method
        ].cacheSend(this.description, timestamp, {
          from: this.activeAccount,
          value: this.drizzleInstance.web3.utils.toWei(this.prize, "ether"),
        });
      }
    },
  },
  data: () => ({
    prize: "",
    description: "",
    date: "",
    time: "",
  }),
};
</script>
