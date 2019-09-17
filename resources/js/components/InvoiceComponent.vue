<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="invoice">
                    <div class="invoice-header">
                    <h2>XYZ Restaurant Pvt Ltd</h2>
                    <h5>Chyasal -9 , Lalitpur</h5>
                    <h5>Phone: 9851145224</h5>
                    </div>
                    <img src="dummy-logo.jpg" class="logo-left" />
                    <div class="invoice-body">
                        <form>
                            <div class="row">
                                <div class="col-md-7 pull-left text-left">
                                    <p>Order #{{orderno}}
                                    <br/>
                                    Customer Info
                                    </p>
                                    <input type="hidden" name="order_no" :value="orderno" id="order_no" />
                                    <select class="form-control" v-on:change="billPartyOption($event)">
                                        <option value="0">By Table</option>
                                        <option value="1">Enter Details</option>
                                    </select>
                                    
                                        <input type="text" name="bill_party_name" class="form-control" placeholder="Enter Table/Customer Name" :value="customer_name" />
                                        <textarea v-show="billTypeEnter" type="text" placeholder="Customer Address" name="bill_party_address" class="form-control"></textarea>
                                </div>
                                <div class="col-md-5 pull-right text-right">
                                    <h4>Invoice</h4>
                                    <p>Invoice #{{invoiceno}}</p>
                                    <input type="hidden" name="invoice_no" :value="invoiceno" id="invoice_no" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table details">
                                        <thead>
                                            <tr>
                                                <th style="width:5%">S.N</th>
                                                <th style="width:55%">Particular</th>
                                                <th style="width:5%">Qty</th>
                                                <th style="width:10%">Rate</th>
                                                <th style="width:10%">Amt</th>
                                                <th style="width:15%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="order_line_details">
                                            <tr v-for="(item,index) in orderItems">
                                                <input type="hidden" name="particular[]" :value="item.particular"/>
                                                
                                                <input type="hidden" name="rate[]" :value="item.rate"/>
                                                <input type="hidden" name="amount[]" :value="item.amount"/>

                                                <td>{{index+1}}</td>
                                                <td>{{item.particular}}</td>
                                                <td><input type="number" style="width:50px" min=1 name="quantity[]" :value="item.quantity" v-on:change="updateQuantity(index,$event)"/></td>
                                                <td>{{item.rate}}</td>
                                                <td>{{item.amount}}</td>
                                                <td><span role="button" class="btn btn-danger" v-on:click="removeItem(index)" style="height:20px; padding:2px 5px;font-size: 12px">Delete</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-left" rowspan="5">
                                                    <p>notes</p>
                                                    <textarea class="form-control" style='margin-bottom:10px'></textarea>
                                                     <span role="button" class="btn btn-primary" v-on:click="printOrder()">Print</span>
                                                    <span role="button" class="btn btn-primary" v-on:click="placeOrder()">Place Order</span>
                                                </td>

                                                <td colspan="2" class="text-right">
                                                    Sub Total <input type="hidden" name="subtotal" :value="subTotal"/>
                                                </td>
                                                <td colspan="2" class="text-left">{{subTotal}}</td>

                                            </tr>
                                            <tr>
                                                
                                                <td colspan="2" class="text-right">
                                                    Dis ({{discountRate}}%) <input type="hidden" name="discount" :value="discount"/>
                                                </td>
                                                <td colspan="2" class="text-left">{{discount}}</td>
                                                
                                            </tr>
                                             <tr>
                                                
                                                <td colspan="2" class="text-right">
                                                    Amount <input type="hidden" name="taxable_amount" :value="taxableAmount"/>
                                                </td>
                                                <td colspan="2" class="text-left">{{taxableAmount}}</td>
                                                
                                            </tr>
                                            <tr>
                                                
                                                <td colspan="2" class="text-right">
                                                    Vat ({{vatRate}}%) <input type="hidden" name="vat_amount" :value="vatAmount"/>
                                                </td>
                                                <td colspan="2" class="text-left">{{vatAmount}}</td>
                                                
                                            </tr>
                                            <tr>
                                                
                                                <td colspan="2" class="text-right">
                                                    Grand Total 
                                                </td>
                                                <td colspan="2" class="text-left">
                                                    <input type="hidden" name="final_amount" :value="totalAmount"/>
                                                {{totalAmount}}</td>
                                                
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            this.loadOrderItems();
           
        },
        data(){
            return{
                orderItems:[],
                invoiceno:1,
                orderno:1,
                billTypeEnter:false,
                subTotal:0,
                discountRate:0,
                discount:0,
                taxableAmount:0,
                vatRate:0,
                vatAmount:0,
                totalAmount:0,
                customer_name:"",
            }
        },
        methods:{
            billPartyOption:function(event){
                if(event.target.value=="1"){
                    this.billTypeEnter=true;     
                }else{
                    this.billTypeEnter=false;
                }
            },
            loadOrderItems:function(){
                

            },
            placeOrder:function(){

            },
            printOrder:function(){

            },
            removeItem:function(index){
                this.$root.orderManager.orderItems.splice(index,1);
                this.$root.orderManager.calculateTotals();
            },
            updateQuantity:function(index,event){
                var value=$(event.target).val();
                this.$root.orderManager.updateQuantity(index,value);
                this.$root.orderManager.calculateTotals();
            }
        },
        watch: {
            "$root.orderManager.orderItems":{
                handler:function(val,oldval){
                this.orderItems=this.$root.orderManager.orderItems;
                this.subTotal=this.$root.orderManager.subTotal;
                this.discountRate=this.$root.orderManager.discountRate;
                this.discount=this.$root.orderManager.discount;
                this.taxableAmount=this.$root.orderManager.taxableAmount;
                this.vatRate=this.$root.orderManager.vatRate;
                this.vatAmount=this.$root.orderManager.vatAmount;
                this.totalAmount=this.$root.orderManager.totalAmount;
                 }
            },
             "$root.orderManager.subTotal":{
                handler:function(val,oldval){
                this.subTotal=this.$root.orderManager.subTotal;
                this.discountRate=this.$root.orderManager.discountRate;
                this.discount=this.$root.orderManager.discount;
                this.taxableAmount=this.$root.orderManager.taxableAmount;
                this.vatRate=this.$root.orderManager.vatRate;
                this.vatAmount=this.$root.orderManager.vatAmount;
                this.totalAmount=this.$root.orderManager.totalAmount;
                 }
            },
             "$root.orderManager.orderno":{
                handler:function(val,oldval){
                this.orderno=this.$root.orderManager.orderno;
                this.customer_name=this.$root.orderManager.customer_name;
                 }
            },
        }
    }
</script>
