import React, { FC, useState, useEffect } from "react";
import { Input, InputNumber, DatePicker, FieldLabel, Select, ImageUploader, DragDrop } from "@src/components/controls";
import { useFormContext } from "react-hook-form";
import { Row, Col } from "antd";
interface CommonFormProps {
  formField: any;
}
export const CommonForm: FC<CommonFormProps> = ({ formField }) => {
  const { control, setValue } = useFormContext();
  const { fieldName, label, inputType, options, defaultValue, validation, Col, position } = formField || {};

  useEffect(() => {
    setValue(fieldName, defaultValue);
  }, [formField, setValue]);

  if (inputType === "text") {
    return (
      <div>
        <FieldLabel name={fieldName} label={label} />
        <Input control={control} name={fieldName} type={inputType} size="large" />
      </div>
    );
  } else if (inputType === "number") {
    return (
      <div>
        <FieldLabel name={fieldName} label={label} />
        <InputNumber control={control} name={fieldName} />
      </div>
    );
  } else if (inputType === "select") {
    return (
      <div>
        <FieldLabel name={fieldName} label={label} />
        <Select control={control} name={fieldName} options={options} />
      </div>
    );
  } else if (inputType === "date") {
    return (
      <div>
        <FieldLabel name={fieldName} label={label} />
        <DatePicker control={control} name={fieldName} />
      </div>
    );
  } else if (inputType === "file") {
    return (
      <div>
        <FieldLabel name={fieldName} label={label} />
        <DragDrop control={control} name={fieldName} onRemoveFile={() => {}} />
      </div>
    );
  } else {
    return <></>;
  }
};
