Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6794C11776B
	for <lists+linux-audit@lfdr.de>; Mon,  9 Dec 2019 21:31:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575923515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sGtrYclKVkfTqWowzkvR/apQS9Q+vWaDv3gBhVaf5Y0=;
	b=Ao2c1DcfRhP0elcCh8OnJITE7bF72lgBefuvMIrLRlfR7PKEB8WG+LnA8+Jh1PxgjNNoSV
	HNOXEuU85i5rnNCwcnTdqKZB6o/Yr0bc+GMdIS1VYoTmRzBteRTO++fuLh+mnVtN59bCF6
	eZz6IPmt6WKHq/M08eIfMKdqCCPoBZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-fpkTpjv4MsSzG_n2fUEyMA-1; Mon, 09 Dec 2019 15:31:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C990218A8C87;
	Mon,  9 Dec 2019 20:31:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79F52194BB;
	Mon,  9 Dec 2019 20:31:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7FE765D2B;
	Mon,  9 Dec 2019 20:31:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9KVR5n031028 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 15:31:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0CF28D95FE; Mon,  9 Dec 2019 20:31:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07ED8D95F2
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 20:31:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB6EB900182
	for <linux-audit@redhat.com>; Mon,  9 Dec 2019 20:31:24 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-283-l9ckXBTGMtijN8Dgvizqzg-1; Mon, 09 Dec 2019 15:31:22 -0500
Received: by mail-lj1-f195.google.com with SMTP id z17so17137184ljk.13
	for <linux-audit@redhat.com>; Mon, 09 Dec 2019 12:31:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RtSnkh/bQ3nRcwbPWyDEoC5sS6sTfNQ61n5WXag4RSg=;
	b=dPJk/79wHYcEn83TqAdxmXcSs5SWsJiULXC+QrT8y8tvTxLbw0fB9HF5X7SeTtt9R0
	1TNx+VUXZrXtsh/rUotHhCeQAch9+iNv6/YVxiVp9RXi0ZRknrHiXbVzVvatuEI8KuhS
	x+VBC6P39pc6D0eE0MQLwdQu/bHIeVbJAom9mtGbWuHLauSUO7b9F8rFyrQjKezcyp+3
	1dVxIuPHgtjQa/QiDevKPFYIfY+Mjg//Xyteb2stDvliQRJmYFTEh/bGCFK5gOlh3RNF
	rfBGkcrM5HUI8k1ay597DF0f2Spb7e6bDruH/wNvvtiffENhSHCRu6SqRmuY/RIKk9aQ
	WmOw==
X-Gm-Message-State: APjAAAWdSu6p8j6I38dTAcdF6mtmhOtoFLbIB23CAVFMPc55rkdx2lQj
	EjfjnuAsMrDzjOIFOpMT+IlRKaT4ZFZTNj90o+4d
X-Google-Smtp-Source: APXvYqwNuaM3T1RoYDtFsytt5qY7kCFzvkm2V35m9l8RLEbT2lVNz1KT7NTjE2alakRLWdNQcQZBGT6GCrkypO1NLyE=
X-Received: by 2002:a2e:9d9a:: with SMTP id c26mr686698ljj.225.1575923480292; 
	Mon, 09 Dec 2019 12:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20191201183347.18122-1-frextrite@gmail.com>
	<20191202211915.GF17234@google.com>
	<CAHC9VhTTS43aKQojtoBRRipP7TwhaVnK7DAqpFN0J0_FNLY+sw@mail.gmail.com>
	<20191202233458.GN17234@google.com>
In-Reply-To: <20191202233458.GN17234@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Dec 2019 15:31:09 -0500
Message-ID: <CAHC9VhSLM=MBXEXiwG+in1+WrTvVpSJxm+eYH51xRfMkoCafBA@mail.gmail.com>
Subject: Re: [PATCH v3] kernel: audit.c: Add __rcu annotation to RCU pointer
To: Joel Fernandes <joel@joelfernandes.org>
X-MC-Unique: l9ckXBTGMtijN8Dgvizqzg-1
X-MC-Unique: fpkTpjv4MsSzG_n2fUEyMA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB9KVR5n031028
X-loop: linux-audit@redhat.com
Cc: paulmck@kernel.org, Amol Grover <frextrite@gmail.com>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org, rostedt@kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 2, 2019 at 6:35 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> On Mon, Dec 02, 2019 at 06:24:29PM -0500, Paul Moore wrote:
> > On Mon, Dec 2, 2019 at 4:19 PM Joel Fernandes <joel@joelfernandes.org> wrote:
> > > Good idea to CC the following on RCU patches:
> > > Paul McKenney
> > > Steven Rostedt
> > > (Any others on the RCU maintainers list).
> > > And, the list: rcu@vger.kernel.org
> > >
> > > Could anyone Ack the patch? Looks safe and straight forward.
> >
> > FWIW, this looks reasonable to me, but I don't see this as a critical
> > fix that needs to go in during the merge window.  Unless I see any
> > objections, I'll plan on merging this into audit/next once the merge
> > window closes.
>
> Sounds good, thanks!

FYI, it's in audit/next now.  Thanks again.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

