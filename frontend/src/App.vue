<template>
  <div id="app">
    <ul class="nav justify-content-center">
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/">Inicio</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/treatments">Tratamientos</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/massages">Masajes</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/promo">Promociones</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/about">Sobre Nosotros</router-link>
      </li>
      <li class="nav-item">
        <router-link class="nav-link" active-class="active" to="/contact">Contacto</router-link>
      </li>
    </ul>
    <router-view/>
  </div>
</template>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
