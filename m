Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 59B6714E76F
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CAt1WP4zYqFx3WAzNBQS+fwT0Vb8igm4+fABWvvhch8=;
	b=btmWzJ7cryG8IXL0Pl/nNALST81M6iKSn/Ix1x5do58zmcM9I85iAtOHsWwCWHN6vpcggd
	/UnO9dMyNSFZI+N3J0kYmEWTuTN41Dv1MZmmzAcpMzlLCn4MNqDYD+9EU0+7DsIcFyhQAX
	/FFtTfJZZGAvZwkiGo993kK2ldKm2bI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-kSvC74-RO2C6aJ1DZNOmGw-1; Thu, 30 Jan 2020 22:18:34 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A80CD182B8FA;
	Fri, 31 Jan 2020 03:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FCC277928;
	Fri, 31 Jan 2020 03:18:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2970518089D0;
	Fri, 31 Jan 2020 03:18:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3HrYL019773 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:17:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D74791054F91; Fri, 31 Jan 2020 03:17:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23B51054F8E
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:17:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21843801E62
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:17:52 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-427-SCJiGlgWOdiHRodIhcFfYw-1; Thu, 30 Jan 2020 22:17:50 -0500
Received: by mail-ed1-f68.google.com with SMTP id r18so6263906edl.1
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:17:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yOLVgt8fcj2iGYHey3CUUOmMkAYnS7j8tXgJvVrXU7k=;
	b=OhDg0s5c8GkfzqU9DryYNvAk7yRI0kXRAhdeLsXj6ntFQs7lRY/466ozpBcdAMglC8
	MdZIfsd53tM/gZelGlIhH6i8X7ZmvSpjgiGKQRNxWuKScDhzSAsmoVi4VGKosZ4kWFs0
	0sL1hkGQ8HmQ+H4QsDR/zDmyJKCkWhkG3hdba7QeiEbuPxSr3cvzkf6FDYnCrdRodr2r
	OZWkaCe5Bd2B35odfYe4DtwNamTg00D5RK/nEvrp0f3CJaGEXS3GaHAhsUnr3gD1DTL1
	mk8pbuznx/B3LXFjMgEQVGsgrvDfuKJyOyzYudnO2Y+hUi/wiql19wJCd6FsCAkoV8Gq
	UkhA==
X-Gm-Message-State: APjAAAUkZgq9cR/5zjOWT2xDRhlav1RYypow0wt94TVS8eZfuo8hUfGQ
	1gLjweOJbCuunl315MpNiiu3RVOXiutrNXrYOae/
X-Google-Smtp-Source: APXvYqwTUCYi1zTZ6aAj7T9ZR7RSTow6UhKXtTaXdlQwg4TDpQzCRANFe2+jrAzUPpmkZYRiK/VrJJt2rP9aOfwn3Sk=
X-Received: by 2002:a50:a7a5:: with SMTP id i34mr6842376edc.128.1580440668703; 
	Thu, 30 Jan 2020 19:17:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<c07cc1ecac3aaa09ebee771fa53e73ab6ac4f75f.1577830902.git.rgb@redhat.com>
In-Reply-To: <c07cc1ecac3aaa09ebee771fa53e73ab6ac4f75f.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:17:37 -0500
Message-ID: <CAHC9VhQSzJSJz7YKdjHeW_y4nvoWBHjt00yT+ixNRwGM6+ZMsA@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 2/9] netfilter: normalize ebtables function
	declarations
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: SCJiGlgWOdiHRodIhcFfYw-1
X-MC-Unique: kSvC74-RO2C6aJ1DZNOmGw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3HrYL019773
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Git context diffs were being produced with unhelpful declaration types
> in the place of function names to help identify the funciton in which
> changes were made.
>
> Normalize ebtables function declarations so that git context diff
> function labels work as expected.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  net/bridge/netfilter/ebtables.c | 100 ++++++++++++++++++++--------------------
>  1 file changed, 51 insertions(+), 49 deletions(-)

My comments from the first patch regarding style chanes also applies here.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

