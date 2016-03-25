#**************************************************************************
#* 
#* Copyright (C) 2016  Kiran Karra <kiran.karra@gmail.com>
#*
#* This program is free software: you can redistribute it and/or modify
#* it under the terms of the GNU General Public License as published by
#* the Free Software Foundation, either version 3 of the License, or
#* (at your option) any later version.
#*
#* This program is distributed in the hope that it will be useful,
#* but WITHOUT ANY WARRANTY; without even the implied warranty of
#* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#* GNU General Public License for more details.
#*
#* You should have received a copy of the GNU General Public License
#* along with this program.  If not, see <http://www.gnu.org/licenses/>.
#**************************************************************************

## some simple tests using the energy package to determine if random variates
## from two multivariate distributions are from the same family

source("loadEnergyPackage.R")

# u <- rCopula(1000, normalCopula(0.5, dim = 3))
# cl3 <- claytonCopula(2, dim = 3)
# v <- rCopula(1000, cl3)
# 
# X <- rbind(u,v)
# UU <- rbind(u,u)
# VV <- rbind(v,v)
# 
# cat("**********************\n")
# cat("Different distributions, p-value should be low!\n")
# p <- eqdist.etest(X, c(1000,1000))
# print(p)
# cat("**********************\n")
# 
# cat("**********************\n")
# cat("Same distributions, p-value should be high!\n")
# p <-eqdist.etest(UU, c(1000,1000))
# print(p)
# cat("**********************\n")
# 
# cat("**********************\n")
# cat("Same distributions, p-value should be high!\n")
# p <-eqdist.etest(VV, c(1000,1000))
# print(p)
# cat("**********************\n")

## generate some files for testing the MATLAB port
u <- rCopula(1000, normalCopula(0.5, dim = 3))
cl3 <- claytonCopula(2, dim = 3)
v <- rCopula(1000, cl3)
X <- rbind(u,v)

write.table(u, file = "testfiles/test1_input1.csv", sep = ",",
            row.names = FALSE, col.names = FALSE)
write.table(v, file = "testfiles/test1_input2.csv", sep = ",",
            row.names = FALSE, col.names = FALSE)
p <- eqdist.etest(X, c(1000,1000),R=200)
print(p)

## generate some files for testing the MATLAB port
gu5 <- gumbelCopula(2, dim = 5)
u <- rCopula(1000, gu5)
cl5 <- claytonCopula(8, dim = 5)
v <- rCopula(1000, cl5)
X <- rbind(u,v)

write.table(u, file = "testfiles/test2_input1.csv", sep = ",",
            row.names = FALSE, col.names = FALSE)
write.table(v, file = "testfiles/test2_input2.csv", sep = ",",
            row.names = FALSE, col.names = FALSE)
p <- eqdist.etest(X, c(1000,1000),R=200)
print(p)