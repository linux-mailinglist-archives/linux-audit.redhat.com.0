Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4629E24238A
	for <lists+linux-audit@lfdr.de>; Wed, 12 Aug 2020 02:54:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-eBkXQigpO7qWbj5HrVApGQ-1; Tue, 11 Aug 2020 20:53:58 -0400
X-MC-Unique: eBkXQigpO7qWbj5HrVApGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC5819200C0;
	Wed, 12 Aug 2020 00:53:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 978161002388;
	Wed, 12 Aug 2020 00:53:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2F1BA554F;
	Wed, 12 Aug 2020 00:53:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07C0rY93027512 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 20:53:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36A7C1004159; Wed, 12 Aug 2020 00:53:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276991004C41
	for <linux-audit@redhat.com>; Wed, 12 Aug 2020 00:53:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BB11101A525
	for <linux-audit@redhat.com>; Wed, 12 Aug 2020 00:53:31 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-371-zo1c1kc5M7GW9K45oG3q4A-1; Tue, 11 Aug 2020 20:53:28 -0400
X-MC-Unique: zo1c1kc5M7GW9K45oG3q4A-1
Received: by mail-ej1-f66.google.com with SMTP id g19so383881ejc.9
	for <linux-audit@redhat.com>; Tue, 11 Aug 2020 17:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RYh/gNBc0o62B+oTjwV1g3IEJqvln2YW1WJDmtXO1HE=;
	b=gFMmRFhBdf8jQ9h9mNjDIskO1/EFafaEleOuIq73DR9tjL6Wa/O6PX3jYd0a3gC//8
	umXMiXlV9tw0up/PVoGvXqoPbwuc/B3A0XiCLkJizWVPBukTMrQUPQIWAhDLpo2iTu4g
	dqbLiEVp/ibX80HHFksDenCe3ytC93khRDsPE+yvnOaW8yVu5IcnmToKX6ZRkx5RVQBp
	9bTFZaO+yYcZKXHdQ9HwCXJmeD01KxcbjdvVkcYXLmc+BWooKifT/HyNQkTTlslOw1MQ
	MJ3v1JiNs+JUKomn/aCOmniJLj742rltGOpScKM3Un12XeghSPJD71TJF46agWwT9nQC
	4U1g==
X-Gm-Message-State: AOAM532RT1FXL/+G8J7WoYqsvEjayiLwdjmBQ1rUhpbmzgv4OQAGLPxb
	ITG4IYYzYZEHKwGkFPiD1NrJ1jLalKuhvUGU6ZIVYE/80A==
X-Google-Smtp-Source: ABdhPJxeMY1HlD6iT+SQUDbDeq84zSwUZBHhGdLVNnTttrJ7OyviDIdNfvSgQF8XcLz1IAoqzLv1PXtEwmms30oF5bc=
X-Received: by 2002:a17:907:20e1:: with SMTP id
	rh1mr10469427ejb.106.1597193605390; 
	Tue, 11 Aug 2020 17:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200810010210.4037-1-nramas@linux.microsoft.com>
In-Reply-To: <20200810010210.4037-1-nramas@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 11 Aug 2020 20:53:14 -0400
Message-ID: <CAHC9VhQFPF_+Eo7P7xbEQkvWG8afb1NT71hKBc2HUKs8jFhCkQ@mail.gmail.com>
Subject: Re: [PATCH] field-dictionary.csv: Add errno to audit message field
	dictionary
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-integrity@vger.kernel.org, zohar@linux.ibm.com,
	linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Aug 9, 2020 at 9:02 PM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> Error code was not included in the audit messages logged by
> the integrity subsystem in the Linux kernel.
>
> commit 2f845882ecd2 in https://github.com/torvalds/linux tree added
> "errno" field in the audit messages logged by the integrity subsystem.
> The "errno" field will be set to 0 when the operation was completed
> successfully, and on failure a non-zero error code is set in this field
> in the audit message.
>
> Add the documentation for the "errno" field in the audit message
> field dictionary.
>
> Sample audit message from the integrity subsystem with errno field:
>
>     [    6.303048] audit: type=1804 audit(1592506281.627:2): pid=1 uid=0 auid=4294967295 ses=4294967295 subj=kernel op=measuring_key cause=ENOMEM comm="swapper/0" name=".builtin_trusted_keys" res=0 errno=-12
>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  specs/fields/field-dictionary.csv | 1 +
>  1 file changed, 1 insertion(+)

Merged.  Thanks for following up with this.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

