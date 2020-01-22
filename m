Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 220B2145E10
	for <lists+linux-audit@lfdr.de>; Wed, 22 Jan 2020 22:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579728664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9whqqjhzvrdL8AcPGDhxks19Xe6Yxw3IYAYifUvmSts=;
	b=SRjjYaUzXQIG0uQWEZprMi8Wr9PRRgbCtutqdZWZHwiWLCR7dxlv/TEhCk51lVhBKK7W8q
	v6xYHfZpVAAqAOKeulUANSish/gDlc/h2yKU5t0spiIFvdo8mdE4i29MGvWSOPhzIQTegI
	5B7sbWpmqIL7qhfUVtDQGs/cVIbs44w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-JxVQDpWJNEOpltk2kJkuQA-1; Wed, 22 Jan 2020 16:31:01 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B2CDB63;
	Wed, 22 Jan 2020 21:30:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A0D3194BB;
	Wed, 22 Jan 2020 21:30:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8F0618089D5;
	Wed, 22 Jan 2020 21:30:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MLT55c003567 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 16:29:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5229A2166B27; Wed, 22 Jan 2020 21:29:05 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE462166B28
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAFD7803B3F
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 21:28:56 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-URn-sYyIPmaPa-DMKM3zww-1; Wed, 22 Jan 2020 16:28:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id o13so726676ljg.4
	for <linux-audit@redhat.com>; Wed, 22 Jan 2020 13:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=USiqOlQcAGwAU4lLldkez+ILA+mr5UwSGgb0G/ckznI=;
	b=EpfJQCk6+1mNT+mOpII8SvDOEUlNirIl/2Dg0Fi1CTQlyHmIlrY+xzH7t9jHzH7Fnh
	7IkGx/nwUCrPjiAeq96bngVyf0lfR9GJa1M1duLMmXMfgiXHAeGFZYGu3sCiny7wU3I+
	9FGpuAeTQZYaxFEMx7Htt3JK8CF80CmkZYQP2dQXfqGD/RdSxCEZ/0nEwE1yIAttNVcP
	bWlDp2bYx9sLIAqyo0EucnWxeX1sSD35yqyzoXLIfsDTm6TjXfReqyy5peB+2gGxwRX+
	dONoTDVPbXMlBdluOcwnad0uMoG96ZZw0OlRB+Gd0TX9uqFs1ZjtT9azSQr21qhHM2z2
	JzZw==
X-Gm-Message-State: APjAAAX+2GW7cB//tGpRsxRHgsua1EAEEZjnKj+7jE/9UdhxvPoYVvNh
	qmJT+eSu2d2OynUFHzslPZTt6UYkVHKJJGfFxsEh
X-Google-Smtp-Source: APXvYqxv+HwClvqbjPOmF70g6vWAGoqQq5nvKaKJ9i+5808mWnhq6PoDHjQ2dbc6K34/pUaYI6i8SCPyRPmgc0tTqfs=
X-Received: by 2002:a2e:870b:: with SMTP id m11mr20501589lji.93.1579728530781; 
	Wed, 22 Jan 2020 13:28:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<7d7933d742fdf4a94c84b791906a450b16f2e81f.1577736799.git.rgb@redhat.com>
In-Reply-To: <7d7933d742fdf4a94c84b791906a450b16f2e81f.1577736799.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 22 Jan 2020 16:28:39 -0500
Message-ID: <CAHC9VhSuwJGryfrBfzxG01zwb-O_7dbjS0x0a3w-XjcNuYSAcg@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: URn-sYyIPmaPa-DMKM3zww-1
X-MC-Unique: JxVQDpWJNEOpltk2kJkuQA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MLT55c003567
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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

On Tue, Dec 31, 2019 at 2:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Add audit container identifier support to the action of signalling the
> audit daemon.
>
> Since this would need to add an element to the audit_sig_info struct,
> a new record type AUDIT_SIGNAL_INFO2 was created with a new
> audit_sig_info2 struct.  Corresponding support is required in the
> userspace code to reflect the new record request and reply type.
> An older userspace won't break since it won't know to request this
> record type.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  include/linux/audit.h       |  7 +++++++
>  include/uapi/linux/audit.h  |  1 +
>  kernel/audit.c              | 35 +++++++++++++++++++++++++++++++++++
>  kernel/audit.h              |  1 +
>  security/selinux/nlmsgtab.c |  1 +
>  5 files changed, 45 insertions(+)

...

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 0871c3e5d6df..51159c94041c 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -126,6 +126,14 @@ struct auditd_connection {
>  kuid_t         audit_sig_uid = INVALID_UID;
>  pid_t          audit_sig_pid = -1;
>  u32            audit_sig_sid = 0;
> +/* Since the signal information is stored in the record buffer at the
> + * time of the signal, but not retrieved until later, there is a chance
> + * that the last process in the container could terminate before the
> + * signal record is delivered.  In this circumstance, there is a chance
> + * the orchestrator could reuse the audit container identifier, causing
> + * an overlap of audit records that refer to the same audit container
> + * identifier, but a different container instance.  */
> +u64            audit_sig_cid = AUDIT_CID_UNSET;

I believe we could prevent the case mentioned above by taking an
additional reference to the audit container ID object when the signal
information is collected, dropping it only after the signal
information is collected by userspace or another process signals the
audit daemon.  Yes, it would block that audit container ID from being
reused immediately, but since we are talking about one number out of
2^64 that seems like a reasonable tradeoff.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

