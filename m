Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5B662DF0
	for <lists+linux-audit@lfdr.de>; Mon,  9 Jan 2023 19:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673287365;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=avZl7a7r7QlYs8ic/SHTStM1+mKuSJNAhCBvmO7zU5M=;
	b=DbpK8ewoK3nSega5Kch0Ms9/74Is0tziSHKIupgqizRIExupISr4NjmBspmSAsX4lAm3vu
	P031qliNI2+xYgYRcVc4oGuz9e7WFNDnqv6IUUnGRk/pt/e8v77QFpShcdpLZXJw/iGcRG
	x1+9/uMOecaSLcfZgVD5yQccj6MuyDg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-CQX-vmpTMz-B7Y5lsNyShg-1; Mon, 09 Jan 2023 13:02:44 -0500
X-MC-Unique: CQX-vmpTMz-B7Y5lsNyShg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A891857F40;
	Mon,  9 Jan 2023 18:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A71D140EBF5;
	Mon,  9 Jan 2023 18:02:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9519194975A;
	Mon,  9 Jan 2023 18:02:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D95941946587 for <linux-audit@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 18:02:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 949BF2026D68; Mon,  9 Jan 2023 18:02:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D4A82026D4B
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 18:02:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7E085C6E0
 for <linux-audit@redhat.com>; Mon,  9 Jan 2023 18:02:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-W1TLHpEuN4-xzdIG61MtHg-1; Mon, 09 Jan 2023 13:02:25 -0500
X-MC-Unique: W1TLHpEuN4-xzdIG61MtHg-1
Received: by mail-pl1-f179.google.com with SMTP id s8so2053524plk.5
 for <linux-audit@redhat.com>; Mon, 09 Jan 2023 10:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P87IPDH/o+UtgBFzZzoAmaEbk6ra90DahJtQchGb1xw=;
 b=DqstI1m1oeVB7ApnvHUf4mkJK8feWdqpjtMNd9tWX6bCyzXvysmtaIE8T0TtkvQ+1I
 43xSjLPcpMvcZ4sXTeEHUGsO346Ww90Qdxq38JWGxvuSerDPtzsgAW9O6X9BZGLqQ0RX
 6i/M73Dtx9w6W1cHSW0OQUg+IKXcmJuaDFvVctehfXdYYf0kvks9vUn6czPGodGZek29
 JYOnubkJ2MhHz6AJiieBSa7v62yuzPIQL1JqEnXWjUjNMJEuYTZBNzEYO7CWWsRmztQE
 Y1M/Pgzp+xVnFP4FUeBawCvhikOVa0sNdYfaNLvOOW5sQypuu6J9H5gg9H9/9fKE0Wtr
 GhOg==
X-Gm-Message-State: AFqh2kqrgyHLM+z0+vpAiV6ibSWP5ZdVfCroO4PSPwnt6ardxel9CfcN
 AVkWJWxkBCHoVnb70qK4U7NIhbf6ADzKuqe6lPNGBbRML/OO
X-Google-Smtp-Source: AMrXdXsxDXjFgp8RTXOV1v8Pky5ZQjmJZlMVDOBJBZZq13XMLkqlaukrDMA/2t2DKIR2tErSGzGzEfHFlYUSgHH163Y=
X-Received: by 2002:a17:902:cec8:b0:192:6675:8636 with SMTP id
 d8-20020a170902cec800b0019266758636mr3603232plg.15.1673287344795; Mon, 09 Jan
 2023 10:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20230106154400.74211-1-paul@paul-moore.com>
 <20230106154400.74211-2-paul@paul-moore.com>
 <CAKH8qBtr3A+EH2J6DCaVbgoGMetKbLUOQ8ZF=cJSFd8ym-0vxw@mail.gmail.com>
 <CAHC9VhRLSAbSHE1nTGwjuUdMtfwTsRVjhV+eznWRw5Ju_qgDAA@mail.gmail.com>
 <Y7xVxT7gWIhRitza@google.com>
In-Reply-To: <Y7xVxT7gWIhRitza@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Jan 2023 13:02:13 -0500
Message-ID: <CAHC9VhRwOjgEDqxw6n16OW4e99tkczZPEcsZ-EvO8zx44yb8ww@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] bpf: remove the do_idr_lock parameter from
 bpf_prog_free_id()
To: sdf@google.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: bpf@vger.kernel.org, linux-audit@redhat.com,
 Burn Alting <burn.alting@iinet.net.au>, Alexei Starovoitov <ast@kernel.org>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 9, 2023 at 12:58 PM <sdf@google.com> wrote:
> On 01/09, Paul Moore wrote:
> > On Fri, Jan 6, 2023 at 2:45 PM Stanislav Fomichev <sdf@google.com> wrote:
> > >
> > > On Fri, Jan 6, 2023 at 7:44 AM Paul Moore <paul@paul-moore.com> wrote:
> > > >
> > > > It was determined that the do_idr_lock parameter to
> > > > bpf_prog_free_id() was not necessary as it should always be true.
> > > >
> > > > Suggested-by: Stanislav Fomichev <sdf@google.com>
> > >
> > > nit: I believe it's been suggested several times by different people
>
> > As much as I would like to follow all of the kernel relevant mailing
> > lists, I'm short about 30hrs in a day to do that, and you were the
> > first one I saw suggesting that change :)
>
> Sure, sure, I'm just stating it for the other people on the CC. So maybe
> we can drop this line when applying.

That's fine with me.  To be honest, you folks can do whatever tweaks
you want to these patches and that's okay with me; or even just dump
them and rewrite them as you see fit, if that's easier.  I'm only
concerned with getting the regression fixed, who fixes it isn't
something I'm worried about.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

