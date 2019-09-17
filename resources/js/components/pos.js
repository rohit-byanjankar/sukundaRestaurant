    export default {
                subTotal:0,
                discountRate:0,
                discount:0,
                taxableAmount:0,
                vatRate:0,
                vatAmount:0,
                totalAmount:0,
                orderItems:[],
                orderno:0,
                customer_name:"",
            loadData(){
            },
            loadOrder(item){
                this.orderno=item.order_id;
                this.customer_name=item.customer_name;
                this.orderItems=[];
                this.calculateTotals();
                var it={};
                for(var i in item.order_line_items){
                    it={};
                    it.id=item.order_line_items[i].id;
                    it.particular=item.order_line_items[i].particular;
                    it.quantity=item.order_line_items[i].quantity;
                    it.rate=item.order_line_items[i].rate;

                    it.amount=item.order_line_items[i].rate*it.quantity; 
                    this.orderItems.push(it);                   
                }
                this.calculateTotals();
            },
            addOrderItem(item){
                var i={};
                i.id=item.id
                i.particular=item.title;

                if(this.checkItemExists(item)){
                    var index=this.getItemIndex(item);
                    this.orderItems[index].quantity=parseInt(this.orderItems[index].quantity)+1;
                    this.orderItems[index].amount=this.orderItems[index].quantity*item.price;
                }else{
                i.quantity=1;                
                i.rate=item.price;
                i.amount=i.quantity*item.price;
                this.orderItems.push(i);
                }
                this.calculateTotals();
            },
            checkItemExists(item){
                for(var i in this.orderItems){
                    if(this.orderItems[i].particular==item.title && this.orderItems[i].id==item.id){
                        return true;
                    }
                }
                return false;
            },
            getItemIndex(item){
                for(var i in this.orderItems){
                    if(this.orderItems[i].particular==item.title && this.orderItems[i].id==item.id){
                        return i;
                    }
                }
                return 0;
            },
            calculateTotals(){
                var total=0;
                for(var i in this.orderItems){
                    total+=this.orderItems[i].amount;
                }
                this.subTotal=total;
                this.discountRate=0;
                this.discount=Math.round(this.subTotal*(this.discountRate/100));
                this.vatRate=13;
                this.taxableAmount=this.subTotal-this.discount;
                this.vatAmount=Math.round(this.taxableAmount*(this.vatRate/100));
                this.totalAmount=this.taxableAmount+this.vatAmount;
            },
            updateQuantity(index,value){
                
                this.orderItems[index].quantity=value;

                this.orderItems[index].amount=this.orderItems[index].quantity*this.orderItems[index].rate;
            }
        }
    

