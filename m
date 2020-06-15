Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8A70E1FA3C1
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jun 2020 00:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592261532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=E/9XiIflgF2J5bHnJU0GeklQHNT+NStjGWA0ScNDnHc=;
	b=Eopo9zHnGYvjNVKq/bq9n1DULmhL9xcTYvquHL9gZZn/xnsUTZ1wbTaScTdk2e0CupZ2nW
	hsCUYa6fGKtmSza4DG6qR1Kb9g+DuHNs5TMXYCWRmTRcnFAbfPR9Hv5EQTMMHw4/bXwu9u
	/N+Iln35BS/rqieGjRnfRtobrf+DO4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-fHmTAfcrOvmHybMNqR4lkQ-1; Mon, 15 Jun 2020 18:51:59 -0400
X-MC-Unique: fHmTAfcrOvmHybMNqR4lkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 509C9873404;
	Mon, 15 Jun 2020 22:51:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A54119C71;
	Mon, 15 Jun 2020 22:51:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3FC01809547;
	Mon, 15 Jun 2020 22:51:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05FMpekm009735 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 18:51:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F07D2026E04; Mon, 15 Jun 2020 22:51:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AAF9202683E
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 22:51:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C778316EB
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 22:51:37 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-JtHODIPuNOul7wYyKM5TxA-1; Mon, 15 Jun 2020 18:51:34 -0400
X-MC-Unique: JtHODIPuNOul7wYyKM5TxA-1
Received: by mail-ej1-f66.google.com with SMTP id q19so19282179eja.7
	for <linux-audit@redhat.com>; Mon, 15 Jun 2020 15:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SGExwC1aIDo5/1NE6vpBPs1NX4b+lnmovMgwaKLnO7A=;
	b=mY40q9cPtUmFYfhUl7xDlQDuJXya8AKwo54cfThXxTXWajiHOpcvs8ESNLRBHR/Hg/
	fjDkwUeGR/dGZ5D5OXiu3TI99Rir/vbNK1j2hHbsN3KzuBrObl4L3KaEootuLJqN114d
	Rc+mJTy3acq+QMsye2Z0B3iL5dGGBV+dmUVr32CVJoIMXdmRROM1OPAiFPXGx6FDkMbH
	ZcYhnIRCM4Hq4Ka27jo5Q7u86BjN2g+4jH76xulEgMKiepYYv5kL+4x3YcZoO2FNUEZm
	eeVTac5nAwtM0oVaOVARwbTHvLnQiB11yCwcnHI95JClzZ0mK44LYDcoNtigIne6p2IY
	TvKA==
X-Gm-Message-State: AOAM5316wyNBu9EoZeXyRO+GbZAqXVWS8ShRwzUc+NGuiBTZSPY1A7Rn
	kxfT0OvJSViD0oNp6639o2Z9P1PQ154wG73I4E4W
X-Google-Smtp-Source: ABdhPJwx1DRTehCMO5F4dqY47teRIjLqnY3HxSm5d2M5fUhGXkw5h1uYR4YVOM7dFC5GGztogb3hEIyikdfe0ETfuBk=
X-Received: by 2002:a17:906:2b81:: with SMTP id m1mr67681ejg.488.1592261493251;
	Mon, 15 Jun 2020 15:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200613022633.3129-1-nramas@linux.microsoft.com>
In-Reply-To: <20200613022633.3129-1-nramas@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jun 2020 18:51:22 -0400
Message-ID: <CAHC9VhTmShh8ggdjLKf_ciL6fDt3ZH59BXaXMAgd8LFzqVj6rQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] integrity: Add result field in audit message
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com,
	linux-audit@redhat.com, linux-integrity@vger.kernel.org
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

On Fri, Jun 12, 2020 at 10:26 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
> Result code is not included in the audit messages logged by
> the integrity subsystem. Add "result" field in the audit messages
> logged by the integrity subsystem and set the value to the result code
> passed to integrity_audit_msg() in the "result" parameter.
>
> Sample audit message:
>
> [    6.284329] audit: type=1804 audit(1591756723.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=add_boot_aggregate cause=alloc_entry comm="swapper/0" name="boot_aggregate" res=0 result=-12
>
> [    8.085456] audit: type=1802 audit(1592005947.297:9): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 op=policy_update cause=completed comm="systemd" res=1 result=0
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Suggested-by: Steve Grubb <sgrubb@redhat.com>
> ---
>  security/integrity/integrity_audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

If we can't use "res=" to carry more than 0/1 then this seems reasonable.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/integrity/integrity_audit.c b/security/integrity/integrity_audit.c
> index 5109173839cc..84002d3d5a95 100644
> --- a/security/integrity/integrity_audit.c
> +++ b/security/integrity/integrity_audit.c
> @@ -53,6 +53,6 @@ void integrity_audit_msg(int audit_msgno, struct inode *inode,
>                 audit_log_untrustedstring(ab, inode->i_sb->s_id);
>                 audit_log_format(ab, " ino=%lu", inode->i_ino);
>         }
> -       audit_log_format(ab, " res=%d", !result);
> +       audit_log_format(ab, " res=%d result=%d", !result, result);
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

