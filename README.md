This repository contains programs to encode a hollow matrix from a matrix in its traditional form (array of arrays) and conversely, 
create the traditional representation from the hollow matrix representation.

-  To convert Hollow Matrix to Traditional array, run the file like:
```
|obj|
obj:=HollowMatrix new.
obj arraysFromhollowMatrix.

```
It will ask for the dimension of the matrix and each main diagonal and off-diagonal element.



-  To convert traditional array representation to hollow matrix, run the file like:
```
|obj|
obj:=TraditionalArray new.
obj hollowMatrixFromArrays.

```

It will ask for the number of non-zero elements.
The traditional array always consists of 3 rows and the user needs to enter each row's elements as space-separated values, one row at a time.
