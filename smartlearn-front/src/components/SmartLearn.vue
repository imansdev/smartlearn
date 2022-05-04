<template>
  <div v-if="isDrizzleInitialized">
    <div>
      <drizzle-contract
        contractName="SmartLearn"
        method="getPrize"
        label="Value"
      />

      <drizzle-contract-form
        contractName="SmartLearn"
        method="add"
        :placeholders="['Value']"
      />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'SmartLearn',

  computed: {
    ...mapGetters('drizzle', ['isDrizzleInitialized']),

    placeholders() {
      return ['Description', 'Due Date']
    }
  }
}
</script>

<style></style>
