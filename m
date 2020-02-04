Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 92EFC151DAE
	for <lists+linux-audit@lfdr.de>; Tue,  4 Feb 2020 16:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580831598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O2y8bq9kYLrM7kTcK4hLo4K2Yr32DtDcoTNrpn6Jc8A=;
	b=Z0PzWZSoyDrJTthMIW3dvRwgeL+h5J48U7PEkjq25EMjKEX4c7Dzmp0NiVil0ZdObG4jSW
	5jlz8g6w9xajdXZ1K2Px/bPmjxqmB5OPeOKIzHSiBRHVg4b1ILj16iO50Jvmh8QXiAggQ+
	1HlXvShf0pmGL3sOjlJY+7ytoE/AnwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-i564CUcYMD6_z93L06Ku3w-1; Tue, 04 Feb 2020 10:53:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15639802569;
	Tue,  4 Feb 2020 15:53:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5063C5C1B5;
	Tue,  4 Feb 2020 15:53:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D46B481746;
	Tue,  4 Feb 2020 15:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014FquaQ001143 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 10:52:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82DA0DBF03; Tue,  4 Feb 2020 15:52:56 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEBCD9612
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 15:52:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F9AF80066D
	for <linux-audit@redhat.com>; Tue,  4 Feb 2020 15:52:54 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-394-AD3ZZzRNNHucSUMwGllXMw-1; Tue, 04 Feb 2020 10:52:49 -0500
Received: by mail-ed1-f65.google.com with SMTP id e10so20228852edv.9
	for <linux-audit@redhat.com>; Tue, 04 Feb 2020 07:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0d0fJd2kqJOBxIhDrO5YQ550FVzvPHsXp/LZedW7iYo=;
	b=hlvISXlK+h7HbC7Go3GOugJWJqq8RqraN1ONqzrppjqCZK3NG2dDfquXh6OdhHBqNe
	3XwGXmzZOOL9qnNJViDAJfMDaavED67mW7VbqohkwDlz4rTJp/yCaDfEZKnAezdGzpyv
	lWr7JI9Wd37avOcYsQ0Y7ZoSUXlRDFz5xR/h0KRAU68Wz2CGqEDJD54DveiWenQ0xNtc
	uibXRdHInXp+03som6kDJ/TfCx5jfTh/SU1vSwAYPD+CVkf3OV0lugKCklTZR3u8agAw
	GViSXPNY+8kee58tH7VgZ7icOltI7do64vtFjelYPJk/RvxKkjm+QUvPf1RO7xCCaOpJ
	Sa9Q==
X-Gm-Message-State: APjAAAXzqlJW5cZkQA59zEvvtPND+710BVLncOMldDP0q5K9vCDQew23
	+x5D6zGS7xk4l5RGIh3/uwITUeyIRrQdZcD3LlP/
X-Google-Smtp-Source: APXvYqw+zYvw6F4Umt3lSDJsc2lvOiKELPOHsE6Als0Io7phWfq8MkukCyGdnY7at8Qo98R48gqGhqoNt5voV/XvnH4=
X-Received: by 2002:a17:906:22cf:: with SMTP id
	q15mr26062018eja.77.1580831567900; 
	Tue, 04 Feb 2020 07:52:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com> <5238532.OiMyN8JqPO@x2>
	<20200204131944.esnzcqvnecfnqgbi@madcap2.tricolour.ca>
	<3665686.i1MIc9PeWa@x2>
In-Reply-To: <3665686.i1MIc9PeWa@x2>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 4 Feb 2020 10:52:36 -0500
Message-ID: <CAHC9VhRHfjuv5yyn+nQ2LbHtcezBcjKtOQ69ssYrXOiExuCjBw@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 13/16] audit: track container nesting
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: AD3ZZzRNNHucSUMwGllXMw-1
X-MC-Unique: i564CUcYMD6_z93L06Ku3w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 014FquaQ001143
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 4, 2020 at 10:47 AM Steve Grubb <sgrubb@redhat.com> wrote:
> On Tuesday, February 4, 2020 8:19:44 AM EST Richard Guy Briggs wrote:
> > > The established pattern is that we print -1 when its unset and "?" when
> > > its totalling missing. So, how could this be invalid? It should be set
> > > or not. That is unless its totally missing just like when we do not run
> > > with selinux enabled and a context just doesn't exist.
> >
> > Ok, so in this case it is clearly unset, so should be -1, which will be a
> > 20-digit number when represented as an unsigned long long int.
> >
> > Thank you for that clarification Steve.
>
> It is literally a  -1.  ( 2 characters)

Well, not as Richard has currently written the code, it is a "%llu".
This was why I asked the question I did; if we want the "-1" here we
probably want to special case that as I don't think we want to display
audit container IDs as signed numbers in general.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

