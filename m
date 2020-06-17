Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A86DC1FD8F3
	for <lists+linux-audit@lfdr.de>; Thu, 18 Jun 2020 00:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592433432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R75dL/WuDPPqg1hmSDNmQ0x30n3bacEkPdNTjXIRzs0=;
	b=LJ+CMqutB9r5cCqnnnT5L6lFWmlmy1GDWVKPy3mOAxw1K42Yb8psalHO0IS6kTdHVrKgQ+
	wGUJFx6lIe1jVmLfrUQdf1Epck/oF3cm2ieJFg5VDibH66qolaBKhdjOwNzZYKDXZssmTV
	bwPNaL0t9KoUsZmnRwtKFGGMpQdYVkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-jfxjGUlpODu2sGJAGViTpQ-1; Wed, 17 Jun 2020 18:37:09 -0400
X-MC-Unique: jfxjGUlpODu2sGJAGViTpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFE0A0BD7;
	Wed, 17 Jun 2020 22:37:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B832019931;
	Wed, 17 Jun 2020 22:37:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37F73833C6;
	Wed, 17 Jun 2020 22:36:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HMaoHL013820 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 18:36:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FFA419932; Wed, 17 Jun 2020 22:36:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-114-52.phx2.redhat.com [10.3.114.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D25BD19931;
	Wed, 17 Jun 2020 22:36:43 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH 2/2] integrity: Add errno field in audit message
Date: Wed, 17 Jun 2020 18:36:43 -0400
Message-ID: <3369897.H5lpGJDj0b@x2>
Organization: Red Hat
In-Reply-To: <20200617204436.2226-2-nramas@linux.microsoft.com>
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
	<20200617204436.2226-2-nramas@linux.microsoft.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org,
	zohar@linux.ibm.com, linux-audit@redhat.com,
	linux-integrity@vger.kernel.org, bauerman@linux.ibm.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, June 17, 2020 4:44:36 PM EDT Lakshmi Ramasubramanian wrote:
> Error code is not included in the audit messages logged by
> the integrity subsystem. Add "errno" field in the audit messages
> logged by the integrity subsystem and set the value to the error code
> passed to integrity_audit_msg() in the "result" parameter.
> 
> Sample audit messages:
> 
> [    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0
> auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate
> cause=alloc_entry comm="swapper/0" name="boot_aggregate" res=0 errno=-12
> 
> [    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0
> auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0
> op=policy_update cause=completed comm="systemd" res=1 errno=0
> 
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>

Acked-by: Steve Grubb <sgrubb@redhat.com>

> ---
>  security/integrity/integrity_audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/integrity/integrity_audit.c
> b/security/integrity/integrity_audit.c index 5109173839cc..a265024f82f3
> 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -53,6 +53,6 @@ void integrity_audit_msg(int audit_msgno, struct inode
> *inode, audit_log_untrustedstring(ab, inode->i_sb->s_id);
>  		audit_log_format(ab, " ino=%lu", inode->i_ino);
>  	}
> -	audit_log_format(ab, " res=%d", !result);
> +	audit_log_format(ab, " res=%d errno=%d", !result, result);
>  	audit_log_end(ab);
>  }




--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

