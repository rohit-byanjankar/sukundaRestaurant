<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <p id="search-field" contenteditable style="width:85%; height:30px;background:#fff;float:left;text-align:left; padding-left:10px"></p><span class="glyphicon glyphicon-search btn btn-primary pull-right" style="width:10%;float:right; height:30px">Search</span>
                    </div>

                    <div class="card-body full-page">
                        <div class="row">
                        <div v-on:click="addOrderItem(item)" class="menu-item col-md-3 btn btn-primary" rel="button" role="button" v-for="item in this.menuItems" :style="getBackground(item)">
                            <p style="width:100%;color:white;background:#000;opacity:0.8;height:30px;line-height:30px;padding:0 5px;position: absolute;left:0;bottom:0;margin:0"><span style="float:left">{{item.title}}</span>
                                <span style="float:right">{{item.price}}</span></p>
                        </div>
                        </div>
                        <div class="menu-items-pagination">
                            <nav aria-label="Page navigation example">
                              <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                              </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
           this.loadData();
        },
        data(){
            return{
            menuItems:[],
            }   
        },
        methods:{
            loadData(){
                var item={};
                var url="api/menu-items";
                var self=this;
                axios.get(url).then(response=>{
                    var results=response.data;
                    var items=results.data.data;
                    for(var index in items){
                        item={};
                        item.title=items[index].item_name;
                        item.image=items[index].image;
                        item.price=items[index].price;
                        item.id=items[index].food_menu_item_id;
                        self.menuItems.push(item);
                    }
                });
                   
            },
            getBackground(item){
                if(item.image=="" || item.image==null)item.image="";
                return 'background-image:url("/'+item.image.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")+'"); background-position: center;';
            },
            addOrderItem(item){
                this.$root.orderManager.addOrderItem(item);
            }
        }
    }
</script>
