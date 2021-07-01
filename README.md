# Short Project of paper revision  
## A 3D Model for Color Quantization and Processing IEEE 2016  
Author: Soo-Chang Pei, Hsin-Hua Liu, Tsung-Jung Liu, Kuan-Hsien Liu  
Paper link: https://drive.google.com/file/d/1sWIitCcsllYkipNZpe4GBai79CZ1D2G4/view?usp=sharing  
Reviewer comments: https://drive.google.com/file/d/1hF4fkpgROd0lwyqTp49Kyc07DqWssA-j/view?usp=sharing  
### 1. Flow chart  
  ![image](https://i.ibb.co/wRHX03t/Paper-1-IEEE-TMM-double.jpg)  
  
### 2. Code introduction  
- `ShortProject.m`	    : main code
- `SF.m`	      	      : Create the 3d fibonacci lattice
- `cal_min_distance2.m` : Calculate the minimun distance with orignal image and codebooksize
- `find_cube.m`	        : Reduce the running time of calculating the distance
- `FeatureSIM.m`	      : Calculate the FSIM
- `C_D.m`		            : Calculate the color difference
- `PSNR2 and PSNR3C.m`  : Calculate the color PSNR
- `myplotthree.m`	      : Plot the 3D figure  


### 3. Comparsion of different quantization method 
- Before revising  

    | Quantization methods| PSNR (256)  | PSNR (512)  | PSNR (1024) |
    | ------------------- | ----------: | ----------: | ----------: |
    | Median-Cut          |   33.5 dB   |   35.8 dB   |   38.0 dB   |
    | Octree              |   31.2 dB   |   31.6 dB   |   34.1 dB   |
    | **Proposed method** |   27.8 dB   |   31.4 dB   |   35.2 dB   | 
    
- After revising (Add the time spending, other metrics, other method and other codebook size)  
 
  - Qunatization time (seconds)

    | Codebook Size (n)   | 16      | 32       | 64       | 128      | 256      | 512       | 1024      |
    | ------------------- |----:    |----:     |----:     |----:     |----:     |----:      |----:      |
    | Proposed method     |3.45     |4.85      |4.69      |6.57      |7.02      |9.27       |16.39      |
    | Octree              |4.26     |4.27      |3.68      |3.73      |3.81      |4.06       |4.08       |
    | Median-Cut          |0.49     |0.57    |0.71      |0.91      |1.47      |2.06       |3.55       |
    | K-Means             |0.53     |1.77      |4.84      |15.66     |34.77     |146.03     |336.77     |
    | FCM                 |8.18     |16.17     |32.00     |64.97     |126.97    |257.56     |519.51     |
    | SOM                 |2.08     |3.21      |5.62      |10.83     |22.15     |43.98      |107.23     |  
    
  - PSNR (Peak Signal-to-Noise Ratio)

    | Codebook Size (n)   | 16      | 32      | 64      | 128     | 256     | 512     | 1024    |
    | ------------------- |----:    |----:    |----:    |----:    |----:    |----:    |----:    |
    | Proposed method     |22.3     |22.3     |27.9     |27.9     |31.3     |33.0     |35.6     |
    | Octree              |20.5     |25.6     |26.6     |28.0     |29.8     |33.2     |33.4     |
    | Median-Cut          |27.5     |29.8     |32.0     |34.0     |35.9     |37.7     |39.5     |
    | K-Means             |29.9     |32.4     |34.7     |36.7     |38.5     |40.5     |43.6     |
    | FCM                 |29.4     |31.7     |33.6     |35.1     |36.3     |36.9     |36.4     |
    | SOM                 |29.7     |32.0     |34.7     |36.3     |38.0     |40.5     |41.5     |  
    
  - SSIM (Structural Similarity)

    | Codebook Size (n)   | 16        | 32        | 64        | 128       | 256       | 512       | 1024      |
    | ------------------- |----:      |----:      |----:      |----:      |----:      |----:      |----:      |
    | Proposed method     |0.6325     |0.6670     |0.7940     |0.8091     |0.8572     |0.8971     |0.9289     |
    | Octree              |0.7172     |0.7856     |0.8607     |0.8941     |0.9304     |0.9645     |0.9690     |
    | Median-Cut          |0.8490     |0.8969     |0.9337     |0.9526     |0.9717     |0.9826     |0.9891     |
    | K-Means             |0.8920     |0.9360     |0.9608     |0.9759     |0.9840     |0.9895     |0.9932     |
    | FCM                 |0.8920     |0.9360     |0.9608     |0.9759     |0.9840     |0.9885     |0.9932     |
    | SOM                 |0.8969     |0.9310     |0.9605     |0.9754     |0.9829     |0.9885     |0.9924     |  

  - FSIM (Feature Similarity)

    | Codebook Size (n)   | 16        | 32        | 64        | 128       | 256       | 512       | 1024      |
    | ------------------- |----:      |----:      |----:      |----:      |----:      |----:      |----:      |
    | Proposed method     |0.9640     |0.9688     |0.9888     |0.9874     |0.9934     |0.9967     |0.9983     |
    | Octree              |0.9750     |0.9826     |0.9826     |0.9957     |0.9974     |0.9991     |0.9992     |
    | Median-Cut          |0.9914     |0.9955     |0.9978     |0.9987     |0.9993     |0.9996     |0.9998     |
    | K-Means             |0.9952     |0.9980     |0.9991     |0.9995     |0.9997     |0.9998     |0.9999     |
    | FCM                 |0.9959     |0.9983     |0.9991     |0.9995     |0.9997     |0.9997     |0.9997     |
    | SOM                 |0.9955     |0.9975     |0.9990     |0.9995     |0.9997     |0.9998     |0.9999     |  
    
  - Color difference (CIE76)

    | Codebook Size (n)   | 16       | 32      | 64      | 128     | 256     | 512     | 1024    |
    | ------------------- |----:     |----:    |----:    |----:    |----:    |----:    |----:    |
    | Proposed method     |13.19     |11.32    |7.02     |5.73     |4.11     |3.25     |2.55     |
    | Octree              |20.80     |18.77    |9.69     |8.08     |5.92     |3.74     |3.35     |
    | Median-Cut          |6.90      |5.37     |4.18     |3.32     |2.70     |2.17     |1.76     |
    | K-Means             |5.55      |4.33     |3.49     |2.80     |2.27     |1.82     |1.45     |
    | FCM                 |5.76      |4.49     |3.69     |3.08     |2.62     |2.28     |2.12     |
    | SOM                 |5.77      |4.41     |3.50     |2.85     |2.34     |1.93     |1.57     |  
   
### 4. Performance 
- Example image (Orignal image 256x256):  
  ![image](https://i.ibb.co/XDknL6h/Figure-10-0.jpg)  
- Codebooksize = 256:  
  ![image](https://i.ibb.co/f9dn5B3/Figure-10-1.jpg)  
- Codebooksize = 512:  
  ![image](https://i.ibb.co/K0GhHXC/Figure-10-2.jpg)  
- Codebooksize = 1024:  
  ![image](https://i.ibb.co/6ZbHXY2/Figure-10-3.jpg)  
  
### 5. Limitation of 3D Fibonacci Color Qunatization  
  Some images with the **high contrast** will make the 3D distribution too dispersive, and the quantization result is not good.  
  The man in red which is high contrast with the color of background, so the quantization image couldn't sucessfully color up.
  (e.g. Kodak10_1024.jpg)  
- Kodak10.jpg:  
  ![image](https://i.ibb.co/x3Ktns9/kodim10.png)

- Kodak10.jpg in LAB color space:  
  ![image](https://i.ibb.co/yqNVVMK/Kodak10-lab-cor.jpg)

- Kodak10.jpg with quantization of codebook size=1024  
  ![image](https://i.ibb.co/SsZ2fz9/Kodak10-1024.jpg)

### 6. Final comments revision
Revision of Reviewer comments: https://drive.google.com/file/d/199JHYocvNLVnbWijHdoLSOMlbTeTu2MQ/view?usp=sharing  

### 7. Additional reference (Revision)  

http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.109.7577  
https://www.tandfonline.com/doi/abs/10.1179/174313107X176298  
https://www.sciencedirect.com/science/article/pii/S0031320301001704  
https://link.springer.com/article/10.1186/1687-6180-2011-118  
https://link.springer.com/article/10.1007/s00521-011-0654-y  
https://www.researchgate.net/publication/277903925_An_Effective_Color_Quantization_Method_Using_Color_Importance-Based_Self-Organizing_Maps  
