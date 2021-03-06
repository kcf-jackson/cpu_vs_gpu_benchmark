### Summary
1. Two tasks benefit significantly (> 50X easily) from GPU: Random numbers generation and Matrix Multiplication (as expected). 
2. Other tasks have a 1X ~ 3X improvement. See below for details. 


### Remarks
1. Proper benchmarking should be done with multiple iterations; the small numbers are not that reliable with 1 iteration. 
2. Unless specified otherwise, everything is run with 10000 x 10000 matrices and/or 10000 x 1 vectors.
3. ”Matrix square root" ran into memory issues with GPU when the matrix is too large. 


### Results:
```
  diary on
  
  CPU_Benchmark  
  Generating a 10000 x 10000 matrix of random numbers from normal distribution.  
  Elapsed time is 1.768959 seconds.  
  Matrix inverse: Elapsed time is 13.553936 seconds.  
  Solving linear system: Elapsed time is 3.904369 seconds.  
  LU decomposition: Elapsed time is 3.075633 seconds.  
  QR decomposition: Elapsed time is 6.566616 seconds.  
  SVD decomposition: Elapsed time is 190.291378 seconds.  
  Eigen-decomposition: Elapsed time is 362.086311 seconds.  
  Cholesky decomposition: Elapsed time is 1.013501 seconds.  
  Matrix Multiplication: Elapsed time is 5.447872 seconds.  
  Matrix square root: Elapsed time is 0.203810 seconds.  
  Fast Fourier Transform: Elapsed time is 0.000136 seconds.  
  Inverse Fast Fourier Transform: Elapsed time is 0.000958 seconds.  
  
  GPU_quadro_6000_Benchmark  
  Generating a 10000 x 10000 matrix of random numbers from normal distribution.  
  Elapsed time is 0.022067 seconds.  
  Matrix inverse: Elapsed time is 11.180366 seconds.  
  Solving linear system: Elapsed time is 2.565529 seconds.  
  LU decomposition: Elapsed time is 2.647992 seconds.  
  QR decomposition: Elapsed time is 9.817947 seconds.  
  SVD decomposition: Elapsed time is 114.020283 seconds.  
  Eigen-decomposition: Elapsed time is 104.457433 seconds.  
  Cholesky decomposition: Elapsed time is 1.366156 seconds.  
  Matrix Multiplication: Elapsed time is 0.039464 seconds.  
  Matrix square root for 5000 x 5000 matrix: Elapsed time is 0.000821 seconds.  
  Fast Fourier Transform: Elapsed time is 0.110636 seconds.  
  Inverse Fast Fourier Transform: Elapsed time is 0.000199 seconds.  
  
  GPU_Tesla_C2075_Benchmark
  Generating a 10000 x 10000 matrix of random numbers from normal distribution.  
  Elapsed time is 0.001233 seconds.  
  Matrix inverse: Elapsed time is 10.791055 seconds.  
  Solving linear system: Elapsed time is 2.539591 seconds.  
  LU decomposition: Elapsed time is 2.630779 seconds.  
  QR decomposition: Elapsed time is 9.767391 seconds.  
  SVD decomposition: Elapsed time is 105.120655 seconds.  
  Eigen-decomposition: Elapsed time is 98.302720 seconds.  
  Cholesky decomposition: Elapsed time is 1.361973 seconds.  
  Matrix Multiplication: Elapsed time is 0.036961 seconds.  
  Matrix square root for 5000 x 5000 matrix: Elapsed time is 0.000892 seconds.  
  Fast Fourier Transform: Elapsed time is 0.120601 seconds.  
  Inverse Fast Fourier Transform: Elapsed time is 0.000223 seconds.  
  
  gpuDevice(1)
  
  ans = 
  
    CUDADevice with properties:
  
                        Name: 'Quadro 6000'
                       Index: 1
           ComputeCapability: '2.0'
              SupportsDouble: 1
               DriverVersion: 7.5000
              ToolkitVersion: 6
          MaxThreadsPerBlock: 1024
            MaxShmemPerBlock: 49152
          MaxThreadBlockSize: [1024 1024 64]
                 MaxGridSize: [65535 65535 65535]
                   SIMDWidth: 32
                 TotalMemory: 5.6363e+09
             AvailableMemory: 5.4203e+09
         MultiprocessorCount: 14
                ClockRateKHz: 1147000
                 ComputeMode: 'Default'
        GPUOverlapsTransfers: 1
      KernelExecutionTimeout: 1
            CanMapHostMemory: 1
             DeviceSupported: 1
              DeviceSelected: 1
  
  gpuDevice(2)
  
  ans = 
  
    CUDADevice with properties:
  
                        Name: 'Tesla C2075'
                       Index: 2
           ComputeCapability: '2.0'
              SupportsDouble: 1
               DriverVersion: 7.5000
              ToolkitVersion: 6
          MaxThreadsPerBlock: 1024
            MaxShmemPerBlock: 49152
          MaxThreadBlockSize: [1024 1024 64]
                 MaxGridSize: [65535 65535 65535]
                   SIMDWidth: 32
                 TotalMemory: 5.6366e+09
             AvailableMemory: 5.5492e+09
         MultiprocessorCount: 14
                ClockRateKHz: 1147000
                 ComputeMode: 'Default'
        GPUOverlapsTransfers: 1
      KernelExecutionTimeout: 0
            CanMapHostMemory: 1
             DeviceSupported: 1
              DeviceSelected: 1
  
  diary off
  ```
