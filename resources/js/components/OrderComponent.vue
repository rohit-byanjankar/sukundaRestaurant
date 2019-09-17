<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body full-page">
                        <div class="row">
                        <div v-on:click="loadOrder(item)" v-bind:class="['menu-item',item.status]" role="button" v-for="item in this.orderItems" style="position:relative;">
                            <h4>{{item.number}}</h4>
                            <p>{{item.customer_name}}</p>
                            <p style="width:100%;color:white;background:#000;opacity:0.8;height:50px;padding:0 5px;position: absolute;left:0;bottom:0;margin:0">
                                 <span class="order-statistics">{{item.total}}<br/>Items</span>
                                 <span class="order-statistics">{{item.cooked}}<br/>Ready</span>
                                 <span class="order-statistics">{{item.served}}<br/>Served</span>
                            </p>
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
            orderItems:[],
            }   
        },
        methods:{
            loadData(){
                var item={};
                var url="api/order";

                var self=this;
                axios.get(url).then(response=>{
                    var results=response.data;
                    var items=results.data.data;
                    for(var index in items){
                        item={};
                        item.number=items[index].order_id;
                        item.customer_name=items[index].customer_name;
                        item.total="2";
                        item.cooked="1";
                        item.ready="1";
                        item.served="1";
                        item.status=items[index].order_status;

                        self.orderItems.push(item);
                    }
                });

               
            },
            loadOrder(itema){
                var orderLineItems=[];
                var item={};
                var url="api/order/"+itema.number;
                var self=this;
                 var itemOrder={};
                axios.get(url).then(response=>{
                    var results=response.data;
                    var items=results.order_line_items;
                    itemOrder=results.data;
                    for(var index in items){
                        item={};
                        item.particular=items[index].particular;
                        item.quantity=items[index].quantity;
                        item.rate=items[index].rate;
                        item.status=items[index].particular_status;
                        orderLineItems.push(item);
                    }
                itemOrder.order_line_items=orderLineItems;
                self.$root.orderManager.loadOrder(itemOrder);
                });
            }
        }
    }
</script>
