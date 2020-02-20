#! /bin/bash

ROOT_DIR="/home/compilers/cool_compiler/cool"
COOLC_OUT_DIR="$ROOT_DIR/examples/res/"
MYCOOLC_OUT_DIR="$ROOT_DIR/implementations/PA2/res/"
TEST_PROGRAMS_DIR="$ROOT_DIR/examples"
TEST_PROGRAMS=($(ls ${TEST_PROGRAMS_DIR}/*.cl))
SUCCESS=true

if [ -d "$COOLC_OUT_DIR" ]; then
  echo "Removing all contents from ${COOLC_OUT_DIR}"
  rm -rf ${COOLC_OUT_DIR}*
else
  echo "Creating folder ${COOLC_OUT_DIR}"
  mkdir ${COOLC_OUT_DIR}
fi

if [ -d "$MYCOOLC_OUT_DIR" ]; then
  echo "Removing all contents from ${MYCOOLC_OUT_DIR}"
  rm -rf ${MYCOOLC_OUT_DIR}*
else
  echo "Creating folder ${MYCOOLC_OUT_DIR}"
  mkdir ${MYCOOLC_OUT_DIR}
fi

for cool_program_path in "${TEST_PROGRAMS[@]}"
do
  filename_w_extension=$(basename "$cool_program_path")
  filename="${filename_w_extension%.*}"
  if [ "$filename" = "atoi" ]; then
    echo "$filename_w_extension is not runable. Continuing..."
    continue
  fi

  # check if the outputs of the two compilation processes are the same
  comp_coolc_out=$(coolc $cool_program_path -o "${COOLC_OUT_DIR}/${filename}.s" 2>&1)
  comp_coolc_exit=$?
  comp_mycoolc_out=$(./mycoolc $cool_program_path -o "${MYCOOLC_OUT_DIR}/${filename}.s" 2>&1)
  comp_mycoolc_exit=$?
  if [ "$comp_coolc_exit" -ne "$comp_mycoolc_exit" ]; then
    echo "Different exit codes of the compilation phase for ${cool_program_path}. Failed!"
    SUCCESS=false
    continue
  fi
  if [ "$comp_coolc_out" != "$comp_mycoolc_out" ]; then
    echo "Different out and err outputs of the compilation phase for ${cool_program_path}. Failed!"
    SUCCESS=false
    continue
  fi
  if [ "$comp_coolc_exit" -ne 0 ]; then
    echo "Compilation failed for $cool_program_path in an identical fashion. Continuing..."
    continue
  fi

  # interactive programs are not further tested
  if [ "$filename" = "arith" ] || [ "$filename" = "graph" ] || [ "$filename" = "life" ] || [ "$filename" = "palindrome" ] || [ "$filename" = "sort_list" ]; then
    echo "$filename.s is interactive, testing it ends here Successfully!"
    continue
  fi

  # check if the outputs of the two runs are the same
  run_coolc_out=$(spim "${COOLC_OUT_DIR}/${filename}.s" 2>&1)
  run_coolc_exit=$?
  run_mycoolc_out=$(spim "${COOLC_OUT_DIR}/${filename}.s" 2>&1)
  run_mycoolc_exit=$?
  if [ "$run_coolc_exit" -ne "$run_mycoolc_exit" ]; then
    echo "Different exit codes after running the code generated from ${cool_program_path}. Failed!"
    SUCCESS=false
    continue
  fi
  if [ "$run_coolc_out" != "$run_mycoolc_out" ]; then
    echo "Different out and err outputs after running the code generated from ${cool_program_path}. Failed!"
    SUCCESS=false
    continue
  fi

  echo "Testing for program ${cool_program_path} was Successful!"
done

if $SUCCESS; then
  echo "SUCCESS"
else
  echo "FAILURE"
fi

rm -rf ${COOLC_OUT_DIR}*
rm -rf ${MYCOOLC_OUT_DIR}*
rmdir ${COOLC_OUT_DIR}
rmdir ${MYCOOLC_OUT_DIR}

exit 0

