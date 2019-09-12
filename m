Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D8B0F72
	for <lists+linux-audit@lfdr.de>; Thu, 12 Sep 2019 15:02:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34DBE81F2F;
	Thu, 12 Sep 2019 13:02:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD2FF6017E;
	Thu, 12 Sep 2019 13:02:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7CE5F2551B;
	Thu, 12 Sep 2019 13:02:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8C100Du001646 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 21:00:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FCA3100197A; Thu, 12 Sep 2019 01:00:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 863961001958;
	Thu, 12 Sep 2019 00:59:58 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
	[64.147.123.19])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9FE91DBD;
	Thu, 12 Sep 2019 00:59:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id E21055D5;
	Wed, 11 Sep 2019 20:59:54 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
	by compute3.internal (MEProxy); Wed, 11 Sep 2019 20:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=jo9hPMX06zt4n+izVtw+o/xz0UpZXiz
	EkCTH618SpxA=; b=fpUbp/fqciOUibSzaEno1fXkphaFjNN2VQlG+sPngOGiiOv
	b8EvZYbYA8GOSMSDX3HS7q4FKS5MTsa1hWUvHRB0NXd78KprF7qz1r2JwlHVRSx3
	YiuXEVENUadOdPIGcIlqjPYb92UHCQUwXrlCjzozlGN0zGgQ3hxoAVuvq2jSEzI6
	IzQuB9Q8Vk841vAUEzNL87dy6ZT+7wMknZCrB0AYTwgQBvFz/zNZhHqqorLEYyoe
	xPH4TIfW6l9ngYxm0wiQ2o89aJzI/sf0RUvh0Y8A1WF5ryeN3EcDVeqjAJkz9zgB
	VxeiUxA20hu/7laLlxoBfhlkXHqfw4AMaQpmc3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jo9hPM
	X06zt4n+izVtw+o/xz0UpZXizEkCTH618SpxA=; b=eWmUTNKoDkFmqR/YY8iJ37
	Al4O7vyJAWmKOW7tlokoVnpZS5xUlSzJxlTuJfP8Y2cJVU504FsKuaFeLXn2MxBt
	T5LZ6xfDsPvpL97HEyUmOgyt0p5z0Em3q7QOcE5MrbjkoEcMrh2dcWv3209D952e
	d9LE1gaa7MjZW1dtKMGV8I7I1P5Cm4AqncaohYXnQ5GN9UOgTSuoGfUya9LdI8BT
	nZYE0fDH7GM6wzzjymB50fKlXJehe1DICEPugEqIhQLzssGawLjPH6eZIs2wQf4g
	/6g4e/5Zdx31ZMALl//+o6Z/BryZ1Bub/59L+2dZ0BXRGZpu4Y/SQsKtbKFqOHfg
	==
X-ME-Sender: <xms:iph5XTttBdo21gbUL-e9peravCKiZtgN8lKxBi9QzqH9F61EXGPucg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrtdeggdegudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfifhiohhv
	rghnnhhiucfrrghnvghpihhnthhofdcuoehgphgrnhgvphhinhhtohesfhgrshhtmhgrih
	hlrdhfmheqnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfrrghrrghmpehmrghi
	lhhfrhhomhepghhprghnvghpihhnthhosehfrghsthhmrghilhdrfhhmnecuvehluhhsth
	gvrhfuihiivgeptd
X-ME-Proxy: <xmx:iph5XfZ3hNqfgDTdMAlrJPRN5PcCJRRLxD92PH-ne7o8vxPWMrEhQg>
	<xmx:iph5XVvou9pq05EAVy5wvG7DuOY1ytSFwQXmpr7iB409AX5gKV4b5w>
	<xmx:iph5XWptV-1A7Hv3hYApdQcNJQfmay6vYYQgf2DEjBgZRUpIgeRLtg>
	<xmx:iph5XaOEYaaB4IkrKx2zCtTYB0o5TYIaGRryrAp99n0_6Ytv4mi1Eg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E707D3C00A1; Wed, 11 Sep 2019 20:59:53 -0400 (EDT)
User-Agent: Cyrus-JMAP/3.1.7-227-g18586b54-fmstable-20190911v1
Mime-Version: 1.0
Message-Id: <a66ead37-2959-448a-a688-838f58798ce5@www.fastmail.com>
In-Reply-To: <15531009.1YdTc8d0Yq@x2>
References: <bd4b2f99-89a0-4d59-aeb9-a97be31b0445@www.fastmail.com>
	<15531009.1YdTc8d0Yq@x2>
Date: Thu, 12 Sep 2019 10:59:32 +1000
From: "Giovanni Panepinto" <gpanepinto@fastmail.fm>
To: "Steve Grubb" <sgrubb@redhat.com>, linux-audit@redhat.com
Subject: Re: When is EOE generated?
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Thu, 12 Sep 2019 00:59:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 12 Sep 2019 00:59:57 +0000 (UTC) for IP:'64.147.123.19'
	DOMAIN:'wout3-smtp.messagingengine.com'
	HELO:'wout3-smtp.messagingengine.com'
	FROM:'gpanepinto@fastmail.fm' RCPT:''
X-RedHat-Spam-Score: -0.801  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_LOW, SPF_HELO_PASS,
	SPF_PASS) 64.147.123.19 wout3-smtp.messagingengine.com 64.147.123.19
	wout3-smtp.messagingengine.com <gpanepinto@fastmail.fm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 12 Sep 2019 08:56:01 -0400
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 12 Sep 2019 13:02:18 +0000 (UTC)

Thanks for the response Steve.

What exact criteria the deamon uses when it strips EOE? Is it purely based on the size of the event or remaining disk space or?

That leads me to the next question, can I force it to log EOE regardless?

-- 
Kind Regards,
Giovanni

On Thu, Sep 12, 2019, at 07:19, Steve Grubb wrote:
> Hello,
> 
> On Tuesday, September 10, 2019 11:55:58 PM EDT Giovanni Panepinto wrote:
> > According to
> > https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/h
> > tml/security_guide/sec-audit_record_types , the record EOE gets generated
> > to represent "the end of a multi-record event."
> > 
> > In my audit logs, I can see that for some events, EOE doesn't get
> > generated.
> 
> <snip>
> 
> > So my question is, what defines a multi-record event? And why is EOE not
> > generated when I create a file under /usr/local/bin?
> 
> The EOE record is stripped by the audit daemon to save disk space. The audit 
> libraries and utilities use heuristics to determine the end of an event. So, 
> if you are parsing events with auparse, it will figure out the end of the 
> event and group all related records for you. The EOE record is passes along 
> to the real time interface just in case it helps to mark an event complete 
> before the heuristics determine it is complete.
> 
> -Steve
> 
> 
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
