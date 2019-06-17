<template>
  <div class="lists-block">
    <h1 class="text-center">PRONTO</h1>
    <div v-show="loading" class="loader">しばらくお待ちください...</div>
    <b-row class="row-eq-height">
      <b-col sm="6" md="3" v-for="list in pronto_lists" v-if="pronto_lists"> 
          <b-link :href="list.link" target="_blank"> 
            <div class="per-name">{{list.name}}</div>
            <div class="per-price">{{list.price}}</div>
            <b-img :src="list.image" thumbnail fluid rounded rounded="circle"></b-img>
          </b-link>
          <hr>
      </b-col>
    </b-row>
  </div>
</template>

<script>
  import axios from 'axios';
  
  export default{
    data: function(){
      return{
        pronto_lists:[],
        loading: true
      }
    },
    mounted: function(){
      this.fetch_prontos();
    },
    methods: {
      fetch_prontos: function(){
        axios.get('/api/v1/prontos').then((response) => {
          for(var i = 0; i < response.data.length; i++) {
             this.pronto_lists.push(response.data[i]);
          }
          console.log(response.data[0])
          this.loading = false;
        },(error) => {
             console.log(error);
        });
      }
    }
  };
</script>

<style scoped>
.loader{
  text-align: center;
  font-size:1.5rem;
}

h1{
  font-family: 'Amatic SC', cursive;
}

.row-eq-height {
    display: flex;
    flex-wrap: wrap;
}

.per-name{
  font-size: 0.9rem;
}

.per-price{
  font-size: 0.9rem;
}

.lists-block{
  margin-top: 20px;
}

</style>