<template>
  <div class="lists-block">
  <b-row class="row-eq-height">
    <b-col sm="6" md="3" v-for="list in starbucks_lists" v-if="starbucks_lists"> 
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
        starbucks_lists:[],
      }
    },
    mounted: function(){
      this.fetch_starbucks();
    },
    methods: {
      fetch_starbucks: function(){
        axios.get('/api/v1/starbucks').then((response) => {
          for(var i = 0; i < response.data.length; i++) {
             this.starbucks_lists.push(response.data[i]);
          }
          console.log(response.data[0])
        },(error) => {
             console.log(error);
        });
      }
    }
  };
</script>

<style scoped>
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