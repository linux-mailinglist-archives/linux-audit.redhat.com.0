Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id ED14A2983D5
	for <lists+linux-audit@lfdr.de>; Sun, 25 Oct 2020 23:11:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-VLHoP-skMSOI-1BLk1Yd2g-1; Sun, 25 Oct 2020 18:11:40 -0400
X-MC-Unique: VLHoP-skMSOI-1BLk1Yd2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C0D8803F48;
	Sun, 25 Oct 2020 22:11:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71FF35C1DC;
	Sun, 25 Oct 2020 22:11:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA90C92316;
	Sun, 25 Oct 2020 22:11:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09PMB1ea021322 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 25 Oct 2020 18:11:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B371F1111C86; Sun, 25 Oct 2020 22:11:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8D11111C84
	for <linux-audit@redhat.com>; Sun, 25 Oct 2020 22:10:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FC2A858280
	for <linux-audit@redhat.com>; Sun, 25 Oct 2020 22:10:59 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-V7JzCyi7M0OBoa42zHJ0aQ-1; Sun, 25 Oct 2020 18:10:57 -0400
X-MC-Unique: V7JzCyi7M0OBoa42zHJ0aQ-1
Received: by mail-ed1-f68.google.com with SMTP id a6so6051668edx.6
	for <linux-audit@redhat.com>; Sun, 25 Oct 2020 15:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tdnZw76qVstn6+QH2BD9S0uoR0Bw/i7xKme9YhIoncY=;
	b=S9CxwHvfM0b9CaEWiq6+t65brVoVPElbqe1DsBgE9cPFDVLsNOIRuqB7mVbnQEjgrT
	iRdN++ks2DNR0cjZux03y8Z+4dMbLiMiySo4KS7b5csKHw033lxMvoUe1PEUbNe36q6S
	63YGhqpb7TvuyDeMMpoHILCrv0GB8jcgWCyahl/1722qK8GzwVw8z5CUb7LFbaWPI2qe
	twPz38bGPUs8Cn7gTJC4w2utKIK9l4oq/BfzZeiyNZdYkM9QLwGcif8mp8C7/6TaPIOY
	rD+oAWeuMjrKQHhUCPwEFi4bNmXGGDtl5S5RXJ4dqpsHP9Vocdef4zLCIn2JetpC4GOl
	KI6g==
X-Gm-Message-State: AOAM533VrZO9ZHbOYZoKIaGlLKot2UlO4Lsb1bJ75jZC3f8ieAYuYiiO
	K5squKVJEsVrmvCuVtrxx1dXGdw2I9gR10kbsXjh
X-Google-Smtp-Source: ABdhPJyLEBWv9F4YhwzynfMYVBexdD3GqbUxbBH+vngsdu+ZtVKMJPGPu3mdw4W34PdPX4g0n5METweLV5QzVVSUrKY=
X-Received: by 2002:aa7:d689:: with SMTP id d9mr13357034edr.128.1603663855471; 
	Sun, 25 Oct 2020 15:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
	<8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
In-Reply-To: <8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 25 Oct 2020 18:10:44 -0400
Message-ID: <CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 51/56] audit: fix a kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 23, 2020 at 12:33 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> typo:
>         kauditd_print_skb -> kauditd_printk_skb
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  kernel/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good to me, nice catch.  Would you like me to pull this into the
audit tree or are you intending this to get pulled in as part of the
larger patchset somewhere else?

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 68cee3bc8cfe..0be42cac086b 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -523,7 +523,7 @@ static int auditd_set(struct pid *pid, u32 portid, struct net *net)
>  }
>
>  /**
> - * kauditd_print_skb - Print the audit record to the ring buffer
> + * kauditd_printk_skb - Print the audit record to the ring buffer
>   * @skb: audit record
>   *
>   * Whatever the reason, this packet may not make it to the auditd connection
> --
> 2.26.2

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

