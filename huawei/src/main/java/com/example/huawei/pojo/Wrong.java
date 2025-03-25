package com.example.huawei.pojo;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName wrong
 */
@Data
public class Wrong implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 
     */
    private String word;

    /**
     * 
     */
    private String translation;

    /**
     * 
     */
    private String yinbiao;

    private static final long serialVersionUID = 1L;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Wrong other = (Wrong) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getWord() == null ? other.getWord() == null : this.getWord().equals(other.getWord()))
            && (this.getTranslation() == null ? other.getTranslation() == null : this.getTranslation().equals(other.getTranslation()))
            && (this.getYinbiao() == null ? other.getYinbiao() == null : this.getYinbiao().equals(other.getYinbiao()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getWord() == null) ? 0 : getWord().hashCode());
        result = prime * result + ((getTranslation() == null) ? 0 : getTranslation().hashCode());
        result = prime * result + ((getYinbiao() == null) ? 0 : getYinbiao().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", word=").append(word);
        sb.append(", translation=").append(translation);
        sb.append(", yinbiao=").append(yinbiao);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}