Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5A201FD6E0
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jun 2020 23:15:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592428551;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bt29Vftx/nUC0iBuLJGOn1RCNe9L2pPpJEuzQha6t00=;
	b=eFd+hY9NyMtnlXt368VA06+32YpJ/QpChIxOFjPTi7I7FPPTldjPvo8wu+nTcvBYQnJD3k
	7UtYG0/EeMrszUXS0XMvOuwLEXxOljmX+W0dSPfgGHIo4koOqVCJFzUShB/zqGfs7w72nd
	DRkq6bWvm4bMxuUx199DYk2GRWs3D1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-Jl9C78UzOHeqo_q7OjyNvg-1; Wed, 17 Jun 2020 17:15:49 -0400
X-MC-Unique: Jl9C78UzOHeqo_q7OjyNvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38EA0184D153;
	Wed, 17 Jun 2020 21:15:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A5F2512FE;
	Wed, 17 Jun 2020 21:15:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BCFD1809547;
	Wed, 17 Jun 2020 21:15:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HLFXKb004003 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 17:15:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65887F1019; Wed, 17 Jun 2020 21:15:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61BCDF101F
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 21:15:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0508F8007B3
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 21:15:31 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-BHnx-w34NsKRmvCwdxyUsw-1; Wed, 17 Jun 2020 17:15:26 -0400
X-MC-Unique: BHnx-w34NsKRmvCwdxyUsw-1
Received: by mail-ej1-f67.google.com with SMTP id mb16so4141042ejb.4
	for <linux-audit@redhat.com>; Wed, 17 Jun 2020 14:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aF2QFHszBUveBEYuZ4El0wMTZ2oyuOvfLY0YCwJErgY=;
	b=KSv4e2KNKfF1kTiK5DvW6QV4dKKDoORuZHb58AHuQZoJD8v8YdR0GpDlrO5nrvNmft
	qiaNE0fhSNMMhTaTxcLsNffFQJTQSdr1i+UJnbf4edV7SPjjDZrfKUQXXEGWqVAPcBfk
	I7vwnf9fUkZOCj5uyNFqAP/kYmfX+8uWkAsqh+Z7k6awRmJan0qMEoTTqegemSFEed/Y
	lw2bjyb/tzIaLrZ0sbFNh4Zx69ge0D8y09kEJEMzgC7NEABGGMC+oKzYfAIyRMrfTrI3
	2E5XQp/btU9OlK7TRYQnJxlnhh6GxlVxsX3UenLuQBl636njUEzoMJLGM8uSlGq9qTf2
	/m3A==
X-Gm-Message-State: AOAM530CW7dKdaC2xVV2YZJoNlvyeIWMs0JmAJCpOAdsEpyer7a0pWSz
	4DzJUmrHm6Uk3Oj6wSe0e83k+churAvKfKq1S1+HLdU=
X-Google-Smtp-Source: ABdhPJwpQGCuUs9iFPAHM5LwSxMut1A4ihpgUz0qV9wJycHjByfPFJfNofYDt/VmT8F/+Bwr1wIS1cgTIhYY6STDwXU=
X-Received: by 2002:a17:906:ecef:: with SMTP id
	qt15mr1003538ejb.91.1592428525325; 
	Wed, 17 Jun 2020 14:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200617204436.2226-1-nramas@linux.microsoft.com>
	<20200617204436.2226-2-nramas@linux.microsoft.com>
In-Reply-To: <20200617204436.2226-2-nramas@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jun 2020 17:15:14 -0400
Message-ID: <CAHC9VhTUd1N_W3Axr4PRt2qe56YfxeRiX17hqTnGJrJPVYNRWw@mail.gmail.com>
Subject: Re: [PATCH 2/2] integrity: Add errno field in audit message
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 17, 2020 at 4:44 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> Error code is not included in the audit messages logged by
> the integrity subsystem. Add "errno" field in the audit messages
> logged by the integrity subsystem and set the value to the error code
> passed to integrity_audit_msg() in the "result" parameter.
>
> Sample audit messages:
>
> [    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate cause=alloc_entry comm="swapper/0" name="boot_aggregate" res=0 errno=-12
>
> [    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 errno=0
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  security/integrity/integrity_audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
> index 5109173839cc..a265024f82f3 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -53,6 +53,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
>                 audit_log_format(ab, " ino=%lu", inode->i_ino);
>         }
> -       audit_log_format(ab, " res=%d", !result);
> +       audit_log_format(ab, " res=%d errno=%d", !result, result);
>         audit_log_end(ab);
>  }
> --
> 2.27.0

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

