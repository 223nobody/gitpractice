package com.example.huawei.pojo;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName remember
 */
@Data
public class Remember implements Serializable {
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
    private String yinbiao;

    /**
     * 
     */
    private String meaning;

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
        Remember other = (Remember) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getWord() == null ? other.getWord() == null : this.getWord().equals(other.getWord()))
            && (this.getYinbiao() == null ? other.getYinbiao() == null : this.getYinbiao().equals(other.getYinbiao()))
            && (this.getMeaning() == null ? other.getMeaning() == null : this.getMeaning().equals(other.getMeaning()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getWord() == null) ? 0 : getWord().hashCode());
        result = prime * result + ((getYinbiao() == null) ? 0 : getYinbiao().hashCode());
        result = prime * result + ((getMeaning() == null) ? 0 : getMeaning().hashCode());
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
        sb.append(", yinbiao=").append(yinbiao);
        sb.append(", meaning=").append(meaning);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}