TEST_INCLUDES = -I../../runtime -I.
TEST_LINK = -lm -lrt -lpthread

#NVGPU_CUDA_PATH=/opt/NVIDIA/cuda/
NVGPU_CUDA_PATH=/usr/local/cuda-5.5/
NVGPU_CUDA_PATH=/APPS/cuda/include

matmul-thsim:	
#	gcc $(TEST_INCLUDES) -DOMP_BREAKDOWN_TIMING -g ../../runtime/homp.c ../../runtime/homp_dev.c ../../runtime/dev_xthread.c matmul_mdev.c -c
	gcc $(TEST_INCLUDES) -g  -DOMP_BREAKDOWN_TIMING=1 -DPROFILE_PLOT=1 ../../runtime/homp.c ../../runtime/homp_dev.c ../../runtime/dev_xthread.c matmul_mdev.c -c
	gcc $(TEST_INCLUDES) -g *.o -o $@ ${TEST_LINK}

matmul-nvgpu:
	nvcc $(TEST_INCLUDES) -I${NVGPU_CUDA_PATH}/include -Xcompiler -fopenmp -DDEVICE_NVGPU_SUPPORT=1 -DOMP_BREAKDOWN_TIMING=1 -DPROFILE_PLOT=1 ../../runtime/homp.c ../../runtime/homp_dev.c ../../runtime/dev_xthread.c matmul_mdev.cu  -c
	nvcc $(TEST_INCLUDES) -g *.o -o $@ -L/usr/lib/gcc/x86_64-redhat-linux/4.4.6 -lgomp ${TEST_LINK}

clean:
	rm -rf *.o matmul-*
