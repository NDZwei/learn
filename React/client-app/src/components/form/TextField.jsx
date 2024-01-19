import {FastField} from 'formik';
import React from 'react';
import {memo} from 'react';
import {TextField as Field} from '@material-ui/core';

const TextField = ({name, className = '', ...other}) => (
  <FastField name={name} shouldUpdate={() => true}>
    {({field, meta}) => (
      <Field
        {...field}
        {...other}
        value={(field?.value === 0 ? '0' : field?.value) || ''}
        fullWidth
        className={`input-container ${className}`}
        error={meta && meta.touched && meta.error}
        helperText={meta && meta.touched && meta.error ? meta.error : ''}
        inputProps={{
          required: false,
        }}
      />
    )}
  </FastField>
);

export default memo(TextField);
