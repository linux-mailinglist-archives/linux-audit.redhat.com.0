Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id B0C64188DCA
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 20:14:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584472460;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w0mj+N4/gCGfzxyNZEfvkvhN60uneO55iun2ftGTNTE=;
	b=I1T4+fpD8Ka1YLoi7OiGWB8R4zTeFxnPUwwnQyu+hidBOiYPLsZNbt5b+A+NRSYCTuHuB3
	aH95vqib87zBPNU+lIi4KEaP6z1liq4xhb+yw0ku0TbSPd1LbLNpFu/NZcHpbMbniKEtCH
	UX1RbfpCAV07J9wTFpEmMOkPlcrbULM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-5Op1J19GMkmS79jxSeO3Mg-1; Tue, 17 Mar 2020 15:14:18 -0400
X-MC-Unique: 5Op1J19GMkmS79jxSeO3Mg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9A9B107ACCD;
	Tue, 17 Mar 2020 19:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE31D60BF3;
	Tue, 17 Mar 2020 19:14:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6C7F1809567;
	Tue, 17 Mar 2020 19:14:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HJE10A015176 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 15:14:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AA841001DEF; Tue, 17 Mar 2020 19:14:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.36.110.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A0DD1001B3F;
	Tue, 17 Mar 2020 19:13:53 +0000 (UTC)
Date: Tue, 17 Mar 2020 15:13:48 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: fix error handling in audit_data_to_entry()
Message-ID: <20200317191348.ta2wvakbuxq7xxel@madcap2.tricolour.ca>
References: <158257989798.399121.1279697192021117003.stgit@chester>
MIME-Version: 1.0
In-Reply-To: <158257989798.399121.1279697192021117003.stgit@chester>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-02-24 16:31, Paul Moore wrote:
> Commit 219ca39427bf ("audit: use union for audit_field values since
> they are mutually exclusive") combined a number of separate fields in
> the audit_field struct into a single union.  Generally this worked
> just fine because they are generally mutually exclusive.
> Unfortunately in audit_data_to_entry() the overlap can be a problem
> when a specific error case is triggered that causes the error path
> code to attempt to cleanup an audit_field struct and the cleanup
> involves attempting to free a stored LSM string (the lsm_str field).
> Currently the code always has a non-NULL value in the
> audit_field.lsm_str field as the top of the for-loop transfers a
> value into audit_field.val (both .lsm_str and .val are part of the
> same union); if audit_data_to_entry() fails and the audit_field
> struct is specified to contain a LSM string, but the
> audit_field.lsm_str has not yet been properly set, the error handling
> code will attempt to free the bogus audit_field.lsm_str value that
> was set with audit_field.val at the top of the for-loop.
> 
> This patch corrects this by ensuring that the audit_field.val is only
> set when needed (it is cleared when the audit_field struct is
> allocated with kcalloc()).  It also corrects a few other issues to
> ensure that in case of error the proper error code is returned.
> 
> Cc: stable@vger.kernel.org
> Fixes: 219ca39427bf ("audit: use union for audit_field values since they are mutually exclusive")
> Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/auditfilter.c |   71 +++++++++++++++++++++++++++-----------------------
>  1 file changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> index b0126e9c0743..026e34da4ace 100644
> --- a/kernel/auditfilter.c
> +++ b/kernel/auditfilter.c
> @@ -456,6 +456,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  	bufp = data->buf;
>  	for (i = 0; i < data->field_count; i++) {
>  		struct audit_field *f = &entry->rule.fields[i];
> +		u32 f_val;
>  
>  		err = -EINVAL;
>  
> @@ -464,12 +465,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  			goto exit_free;
>  
>  		f->type = data->fields[i];
> -		f->val = data->values[i];
> +		f_val = data->values[i];
>  
>  		/* Support legacy tests for a valid loginuid */
> -		if ((f->type == AUDIT_LOGINUID) && (f->val == AUDIT_UID_UNSET)) {
> +		if ((f->type == AUDIT_LOGINUID) && (f_val == AUDIT_UID_UNSET)) {
>  			f->type = AUDIT_LOGINUID_SET;
> -			f->val = 0;
> +			f_val = 0;
>  			entry->rule.pflags |= AUDIT_LOGINUID_LEGACY;
>  		}
>  
> @@ -485,7 +486,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  		case AUDIT_SUID:
>  		case AUDIT_FSUID:
>  		case AUDIT_OBJ_UID:
> -			f->uid = make_kuid(current_user_ns(), f->val);
> +			f->uid = make_kuid(current_user_ns(), f_val);
>  			if (!uid_valid(f->uid))
>  				goto exit_free;
>  			break;
> @@ -494,11 +495,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  		case AUDIT_SGID:
>  		case AUDIT_FSGID:
>  		case AUDIT_OBJ_GID:
> -			f->gid = make_kgid(current_user_ns(), f->val);
> +			f->gid = make_kgid(current_user_ns(), f_val);
>  			if (!gid_valid(f->gid))
>  				goto exit_free;
>  			break;
>  		case AUDIT_ARCH:
> +			f->val = f_val;
>  			entry->rule.arch_f = f;
>  			break;
>  		case AUDIT_SUBJ_USER:
> @@ -511,11 +513,13 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  		case AUDIT_OBJ_TYPE:
>  		case AUDIT_OBJ_LEV_LOW:
>  		case AUDIT_OBJ_LEV_HIGH:
> -			str = audit_unpack_string(&bufp, &remain, f->val);
> -			if (IS_ERR(str))
> +			str = audit_unpack_string(&bufp, &remain, f_val);
> +			if (IS_ERR(str)) {
> +				err = PTR_ERR(str);
>  				goto exit_free;
> -			entry->rule.buflen += f->val;
> -
> +			}
> +			entry->rule.buflen += f_val;
> +			f->lsm_str = str;
>  			err = security_audit_rule_init(f->type, f->op, str,
>  						       (void **)&f->lsm_rule);
>  			/* Keep currently invalid fields around in case they
> @@ -524,68 +528,71 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
>  				pr_warn("audit rule for LSM \'%s\' is invalid\n",
>  					str);
>  				err = 0;
> -			}
> -			if (err) {
> -				kfree(str);
> +			} else if (err)

If there is an error from security_audit_rule_init() other than -EINVAL
(which could become valid after a policy reload), would the str passed
to it not need to be freed before we goto exit_free?

I think we need a
				kfree(str);
here (with braces, of course).

>  				goto exit_free;
> -			} else
> -				f->lsm_str = str;
>  			break;
>  		case AUDIT_WATCH:
> -			str = audit_unpack_string(&bufp, &remain, f->val);
> -			if (IS_ERR(str))
> +			str = audit_unpack_string(&bufp, &remain, f_val);
> +			if (IS_ERR(str)) {
> +				err = PTR_ERR(str);
>  				goto exit_free;
> -			entry->rule.buflen += f->val;
> -
> -			err = audit_to_watch(&entry->rule, str, f->val, f->op);
> +			}
> +			err = audit_to_watch(&entry->rule, str, f_val, f->op);
>  			if (err) {
>  				kfree(str);
>  				goto exit_free;
>  			}
> +			entry->rule.buflen += f_val;
>  			break;
>  		case AUDIT_DIR:
> -			str = audit_unpack_string(&bufp, &remain, f->val);
> -			if (IS_ERR(str))
> +			str = audit_unpack_string(&bufp, &remain, f_val);
> +			if (IS_ERR(str)) {
> +				err = PTR_ERR(str);
>  				goto exit_free;
> -			entry->rule.buflen += f->val;
> -
> +			}
>  			err = audit_make_tree(&entry->rule, str, f->op);
>  			kfree(str);
>  			if (err)
>  				goto exit_free;
> +			entry->rule.buflen += f_val;
>  			break;
>  		case AUDIT_INODE:
> +			f->val = f_val;
>  			err = audit_to_inode(&entry->rule, f);
>  			if (err)
>  				goto exit_free;
>  			break;
>  		case AUDIT_FILTERKEY:
> -			if (entry->rule.filterkey || f->val > AUDIT_MAX_KEY_LEN)
> +			if (entry->rule.filterkey || f_val > AUDIT_MAX_KEY_LEN)
>  				goto exit_free;
> -			str = audit_unpack_string(&bufp, &remain, f->val);
> -			if (IS_ERR(str))
> +			str = audit_unpack_string(&bufp, &remain, f_val);
> +			if (IS_ERR(str)) {
> +				err = PTR_ERR(str);
>  				goto exit_free;
> -			entry->rule.buflen += f->val;
> +			}
> +			entry->rule.buflen += f_val;
>  			entry->rule.filterkey = str;
>  			break;
>  		case AUDIT_EXE:
> -			if (entry->rule.exe || f->val > PATH_MAX)
> +			if (entry->rule.exe || f_val > PATH_MAX)
>  				goto exit_free;
> -			str = audit_unpack_string(&bufp, &remain, f->val);
> +			str = audit_unpack_string(&bufp, &remain, f_val);
>  			if (IS_ERR(str)) {
>  				err = PTR_ERR(str);
>  				goto exit_free;
>  			}
> -			entry->rule.buflen += f->val;
> -
> -			audit_mark = audit_alloc_mark(&entry->rule, str, f->val);
> +			audit_mark = audit_alloc_mark(&entry->rule, str, f_val);
>  			if (IS_ERR(audit_mark)) {
>  				kfree(str);
>  				err = PTR_ERR(audit_mark);
>  				goto exit_free;
>  			}
> +			entry->rule.buflen += f_val;
>  			entry->rule.exe = audit_mark;
>  			break;
> +		default:
> +			f->val = f_val;
> +			break;
>  		}
>  	}
>  
> 
> --
> Linux-audit mailing list
> Linux-audit@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-audit

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

