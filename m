Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD481F3B29
	for <lists+linux-audit@lfdr.de>; Tue,  9 Jun 2020 14:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591707290;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=or9dWGORj34QWOfQui7J3JVDujr5fIGKyxmc0pPixHY=;
	b=QYL3M7ER3fQKvr/AS5Wg0BSuRS7rE4KS12vBkFqwXKgERumIhp3dU/wlx4PMoo14xqFKnH
	WyV80lGlVyDtFYaIf2+qaAPo+MxEqvzh/HSmV1mJHQXJdONwVDmHyiGQH9I+Gk4hAhnrvT
	iS4vgtSqtB5ikVA3mOCpgBRK/I+pRxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-stRyB3b3MS6hceckW17NYg-1; Tue, 09 Jun 2020 08:54:47 -0400
X-MC-Unique: stRyB3b3MS6hceckW17NYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC4D188360C;
	Tue,  9 Jun 2020 12:54:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFA096FB1;
	Tue,  9 Jun 2020 12:54:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01522180954D;
	Tue,  9 Jun 2020 12:54:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059CsKdH032060 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 08:54:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18E427C3C4; Tue,  9 Jun 2020 12:54:20 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C84478FA0;
	Tue,  9 Jun 2020 12:54:06 +0000 (UTC)
Date: Tue, 9 Jun 2020 08:54:02 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v3] IMA: Add audit log for failure conditions
Message-ID: <20200609125402.wigqnnhy7lxsyqxf@madcap2.tricolour.ca>
References: <20200608215343.4491-1-nramas@linux.microsoft.com>
MIME-Version: 1.0
In-Reply-To: <20200608215343.4491-1-nramas@linux.microsoft.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-integrity@vger.kernel.org, linux-audit@redhat.com,
	zohar@linux.ibm.com, linux-kernel@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-06-08 14:53, Lakshmi Ramasubramanian wrote:
> The final log statement in process_buffer_measurement() for failure
> condition is at debug level. This does not log the message unless
> the system log level is raised which would significantly increase
> the messages in the system log. Change this log message to an audit
> message for better triaging failures in the function.
> 
> ima_alloc_key_entry() does not log a message for failure condition.
> Add an audit message for failure condition in this function.
> 
> Sample audit messages:
> 
> [    8.051937] audit: type=1804 audit(1591633422.365:8): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=measuring_keys cause=hashing_error(-22) comm="systemd" name=".builtin_trusted_keys" res=0
> 
> [    8.063218] audit: type=1804 audit(1591633422.377:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=measuring_kexec_cmdline cause=alloc_entry(-12) comm="systemd" name="kexec-cmdline" res=0
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  security/integrity/ima/ima.h            |  2 ++
>  security/integrity/ima/ima_main.c       | 37 +++++++++++++++++++++----
>  security/integrity/ima/ima_queue.c      |  2 --
>  security/integrity/ima/ima_queue_keys.c |  4 +++
>  4 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
> index df93ac258e01..8a47249c6238 100644
> --- a/security/integrity/ima/ima.h
> +++ b/security/integrity/ima/ima.h
> @@ -47,6 +47,8 @@ enum tpm_pcrs { TPM_PCR0 = 0, TPM_PCR8 = 8 };
>  
>  #define NR_BANKS(chip) ((chip != NULL) ? chip->nr_allocated_banks : 0)
>  
> +#define AUDIT_CAUSE_LEN_MAX 32
> +
>  /* current content of the policy */
>  extern int ima_policy_flag;
>  
> diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
> index 800fb3bba418..b10f09bc7eca 100644
> --- a/security/integrity/ima/ima_main.c
> +++ b/security/integrity/ima/ima_main.c
> @@ -739,6 +739,9 @@ void process_buffer_measurement(const void *buf, int size,
>  				int pcr, const char *keyring)
>  {
>  	int ret = 0;
> +	const char *audit_cause = "ENOMEM";
> +	const char *op = "measuring_keys";
> +	char measurement_audit_cause[AUDIT_CAUSE_LEN_MAX];
>  	struct ima_template_entry *entry = NULL;
>  	struct integrity_iint_cache iint = {};
>  	struct ima_event_data event_data = {.iint = &iint,
> @@ -793,21 +796,43 @@ void process_buffer_measurement(const void *buf, int size,
>  	iint.ima_hash->length = hash_digest_size[ima_hash_algo];
>  
>  	ret = ima_calc_buffer_hash(buf, size, iint.ima_hash);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		audit_cause = "hashing_error";
>  		goto out;
> +	}
>  
>  	ret = ima_alloc_init_template(&event_data, &entry, template);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		audit_cause = "alloc_entry";
>  		goto out;
> +	}
>  
>  	ret = ima_store_template(entry, violation, NULL, buf, pcr);
> -
> -	if (ret < 0)
> +	if (ret < 0) {
> +		audit_cause = "store_entry";
>  		ima_free_template_entry(entry);
> +	}
>  
>  out:
> -	if (ret < 0)
> -		pr_devel("%s: failed, result: %d\n", __func__, ret);
> +	if (ret < 0) {
> +		snprintf(measurement_audit_cause, AUDIT_CAUSE_LEN_MAX,
> +			 "%s(%d)", audit_cause, ret);
> +
> +		switch (func) {
> +		case KEXEC_CMDLINE:
> +			op = "measuring_kexec_cmdline";
> +			break;
> +		case KEY_CHECK:
> +			op = "measuring_keys";
> +			break;
> +		default:
> +			op = "measuring_blacklisted_hash";
> +			break;
> +		}
> +
> +		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL, eventname,
> +				    op, measurement_audit_cause, ret, 0);
> +	}
>  
>  	return;
>  }
> diff --git a/security/integrity/ima/ima_queue.c b/security/integrity/ima/ima_queue.c
> index fb4ec270f620..4a761d765c6c 100644
> --- a/security/integrity/ima/ima_queue.c
> +++ b/security/integrity/ima/ima_queue.c
> @@ -19,8 +19,6 @@
>  #include <linux/slab.h>
>  #include "ima.h"
>  
> -#define AUDIT_CAUSE_LEN_MAX 32
> -
>  /* pre-allocated array of tpm_digest structures to extend a PCR */
>  static struct tpm_digest *digests;
>  
> diff --git a/security/integrity/ima/ima_queue_keys.c b/security/integrity/ima/ima_queue_keys.c
> index cb3e3f501593..4de31ff172aa 100644
> --- a/security/integrity/ima/ima_queue_keys.c
> +++ b/security/integrity/ima/ima_queue_keys.c
> @@ -68,6 +68,7 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
>  						 size_t payload_len)
>  {
>  	int rc = 0;
> +	const char *audit_cause = "ENOMEM";
>  	struct ima_key_entry *entry;
>  
>  	entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> @@ -88,6 +89,9 @@ static struct ima_key_entry *ima_alloc_key_entry(struct key *keyring,
>  
>  out:
>  	if (rc) {
> +		integrity_audit_msg(AUDIT_INTEGRITY_PCR, NULL,
> +				    keyring->description, "measuring_keys",
> +				    audit_cause, rc, 0);
>  		ima_free_key_entry(entry);
>  		entry = NULL;
>  	}
> -- 
> 2.27.0
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

