 
class Node:
    def __init__(self,data):
        self.__data=data
        self.__next=None
        
    def get_data(self):
        return self.__data
        
    def set_data(self,data):
        self.__data=data
        
    
    def get_next(self):
        return self.__next
        
    def set_next(self,next_data):
        self.__next=next_data
        

class LinkedList:
    
    def __init__(self):
        
        self.__head=None
        self.__tail=None
        
        
    def get_head(self):
        return self.__head
        
        
    #Addition
        
    def add(self,data):
        
        new_node=Node(data)
        if(self.get_head()==None):
            self.__head=self.__tail=new_node
            
        else:
            self.__tail.set_next(new_node)
            self.__tail=new_node
            
    **Searching**
        
    def find(self,data):
        temp=self.get_head()
        while(temp):
            if(temp.get_data()==data):          # If node is found returns node
                return temp
            temp=temp.get_next()
        return None
        
        
        
     ### Insertion
        
    def insert(self,before,new):
        
        new_node=Node(new)                      # Create a node
        
        if(before==None):                       # IF node inserted at head
            new_node.set_next(self.__head)
            self.__head=new_node
            if(new_node.get_next()==None):
                self.__tail=new_node
            
        else:
            node=self.find(before)              # search if node exits
            if(node is not None):               #if node_before exits
                new_node.set_next(node.get_next())
                node.set_next(new_node)
                if(self.__tail==node):
                    self.__tail=new_node
            else:                               # if node does not exist
                print("LinkedList not found or not in the list")
                
    ### Deletion
    
    def delete(self,data):
        
        node=self.find(data)
        if(node is not None):
            if(node==self.__head):              #if the node is at 1 position of a linkedlist
                if(self.__head==self.__tail):   #if there is only one node in a linkedlist
                    self.tail=None
                self.__head=node.get_next()
                
            else:
                temp=self.__head
                while(temp):
                    if(temp.get_next()==node):
                        temp.set_next(node.get_next())
                        if(node==self.__tail):          #if node is last node
                            self.__tail=temp
                        node.set_next(None)
                    temp=temp.get_next()
                    
        else:
            print("Node not found / Not in the list")
                
    ###Display
        
    def display(self):
        
        temp=self.__head
        while(temp):
            print(temp.get_data())
            temp=temp.get_next()
            
            
            
    def __str__(self):
        
        msg=[]
        temp=self.get_head()
        while(temp):
            msg.append(str(temp.get_data()))
            temp=temp.get_next()
            
        msg=",".join(msg)
        msg="LinkedList is : "+msg
        return msg
        
        
l=LinkedList()
l.add("sugar")
l.add("tea")
print(l.find("tea"))
l.delete("milk")
l.insert(None,"milk")
l.display()

