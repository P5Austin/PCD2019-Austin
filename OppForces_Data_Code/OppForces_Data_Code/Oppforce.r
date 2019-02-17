###################
### Experiment 1
##################
#loading data
data.exp1=read.csv(file.choose())#choose Exp_1.csv
# just checking dimensions 
dim(data.exp1) #8803 36
names(data.exp1)
#subsetting data into start configurations and finish configurations 
beg.exp1=subset(data.exp1,data.exp1$StepCounter==0)
end.exp1=subset(data.exp1,data.exp1$StepCounter==100)
head(beg.exp1)
head(end.exp1)
# more checking dimensions 
unique(end.exp1$RatioA)
unique(end.exp1$RatioB)

# A little data organization 
library(abind)
	layer=matrix(NA,nrow=100,ncol=11) 
	exp1.3d=abind(layer,layer,layer,layer,along=3) 
	dim(exp1.3d)
for(h in 1:length(unique(end.exp1$RatioB))){		
	for(i in 1:length(unique(end.exp1$RatioA))){
		exp1.3d[,i,h]=end.exp1$ConfOnes[end.exp1$RatioA==unique(end.exp1$RatioA)[i]&end.exp1$RatioB==sort(unique(end.exp1$RatioB))[h]]
	
	}
}

survival.counts=apply(exp1.3d[,1:7,1:4]>0,MARGIN=c(2,3),sum) # now we total up the number of times minority opinion survives
colnames(survival.counts)=unique(end.exp1$RatioB)
rownames(survival.counts)=unique(end.exp1$RatioA)[1:7]
survival.counts
# we are going to plot this data frame (transposed), which will show how often the minority survived among conformists for each initial condition 
#before the data is transposed: each row refers to a different percentage of minority at the start of the simulations and 
# each column refers to a different percentage of anticonformists in the population 

# Figure 1
png("Figure1.png", width = 7, height = 5, units = 'in', res = 300)
barplot(t(survival.counts),beside=T,col=gray.colors(4),xlab="Initial Support for Minority Opinion",names=paste(seq(0,30,5),"%"),ylab="Survival Rate (% of Simulations)",main="")
 legend("bottomright",legend=c("0%","5%","10%","15%"), title="Anticonformists ",cex=1,bty="y",fill=gray.colors(4),bg="white")
dev.off()
# Figure exports to what you have set as your working directory.

##################
### Experiment 2
##################
# loading data
data.exp2=read.csv(file.choose())#choose Exp_2.csv
#just checking dimensions
dim(data.exp2) #10200 34
names(data.exp2)
#subsetting data into start and finsh configurations
beg.exp2=subset(data.exp2,data.exp1$StepCounter==0)
end.exp2=subset(data.exp2,data.exp2$StepCounter==2000)
# more checking dimensions 
head(beg.exp2)
head(end.exp2)
unique(end.exp2$RatioB)


# conformist holding the minority opinion
# because the simulations had the 45:55 initial opinion distibution,
# sometimes the opinion flipped
# because we are still interested in diversity of opinion,
# this calculation assures we are using the correct number to repressent this
	c.in.m=rep(NA,nrow(end.exp2))
	for (i in 1:nrow(end.exp2)){
		if((end.exp2$Zeros)[i]>=(end.exp2$Ones)[i]){
			c.in.m[i]=end.exp2$ConfOnes[i]
		
		}else{
			c.in.m[i]=end.exp2$ConfZeros[i]
		}
	}	
length(c.in.m) #5100
#adding "c.in.m" to our data.frame
end.exp2.survivals=cbind(end.exp2[,-36],c.in.m)
#aggregating the data across the simulations with the same initial support for minority opinion
comp.exp2=aggregate(end.exp2.survivals, by=list(end.exp2.survivals$RatioB), mean,na.rm=T)
# checking our composite 
head(comp.exp2)
names(comp.exp2)

#finding the sum of the number of times minority of opinion survives for initial support for minority opinion between 0% and 10%
survivals=rep(NA,11)
for(k in 1:11){
survivals[k]=sum(c.in.m[end.exp2$RatioB==unique(end.exp2$RatioB)[k]]>0)
}
survivals


#Figure 2
#making a simple barplot of the survival rates
png("Figure2.png", width = 7, height = 5, units = 'in', res = 300)
barplot(survivals,main="",ylab="Survival Rate (% of Simulations)",xlab="Aniticonformists in Population (%)",names=paste(seq(0,10,1),"%"))
dev.off()


#Figure 3

png("Figure3.png", width = 7, height = 5, units = 'in', res = 300)
#ploting the support for minority opinion at the end of the simulation 

plot(comp.exp2$RatioB*100,comp.exp2$c.in.m/5625/(1-comp.exp2$RatioB)*100, pch=16, ylab="Percentage",xlab="Anticonformists in Population (%)",main="")
#adding points for the average dymanics of the system as percent of the total number of agents
points(comp.exp2$RatioB*100,comp.exp2$Dynamics*100, col="black",pch=2)
legend("topleft",c("Mean Conformist Minority Opinion (% of Conformists)","Mean System Volatility (% of All Agents)"),pch=c(16,2),col=c("black","black"),bg="white",bty="n",cex=.75)
dev.off()

# Figures export to what you have set as your working directory.






