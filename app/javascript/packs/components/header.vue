<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="info">
      <b-navbar-brand href="/" class="site-title">cafe de shibuya</b-navbar-brand>
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="shop-list">
          <b-nav-item href="/starbucks" active>Starbucks Coffee</b-nav-item>
          <b-nav-item href="/doutor" active>DOUTOR</b-nav-item>
          <b-nav-item href="/pronto" active>PRONTO</b-nav-item>
          <b-nav-item href="/tullys" active>Tully's Coffee</b-nav-item>
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
  </div>
</template>

<style scoped>
.site-title{
  font-family: 'Amatic SC', cursive;
  font-size :2.5rem;
}

.shop-list{
  font-family: 'Amatic SC', cursive;
  font-size :1.3rem;
  padding-left: 100px;
}

.shop-list li{
  margin: 0 20px;
}

</style>