import React, { FC, useState, useEffect } from "react";
import { Input, InputNumber, DatePicker, FieldLabel, Select, ImageUploader } from "@src/components/controls";
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
        <Input control={control} name={fieldName} type={inputType} />
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
  } else {
    return <></>;
  }
};

// return (
//   <Row>
//     <Col className="gutter-row">
//       <FieldLabel name={fieldName} label={label} />
//       <Input control={control} name={fieldName} type={inputType} />
//     </Col>
//   </Row>
// );
// if (Col) {
//   return (
//     <Row>
//       <Col className="gutter-row">
//         <FieldLabel name={fieldName} label={label} />
//         <Input control={control} name={fieldName} type={inputType} />
//       </Col>
//     </Row>
//   );
// } else {
//   return (
//     <div>
//       <FieldLabel name={fieldName} label={label} />
//       <Input control={control} name={fieldName} type={inputType} />
//     </div>
//   );
// }
