<template>
  <b-navbar type="info" variant="info" sticky>
    <div class="container">
      <b-navbar-brand href="#">
            <img src="../assets/logo.png" width="30" height="30" class="d-inline-block align-top" alt="Kitten">
            Smart Learn
          </b-navbar-brand>

      <b-navbar-nav>
        <b-nav-item href="#" disabled>
          <drizzle-account units="Ether" :precision="3" />
        </b-nav-item>
      </b-navbar-nav>
    </div>
  </b-navbar>
</template>
