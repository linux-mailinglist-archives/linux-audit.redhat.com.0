Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE659692AA2
	for <lists+linux-audit@lfdr.de>; Fri, 10 Feb 2023 23:59:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676069977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LCK6S44HidcE2cleZboBhQ8scDl1jMXuJpjq97vZYe0=;
	b=YdkESqMdTqrDHqzHQ7tHf1dmRzG/NNhka5S5jiQ/i2vbtocvZvkqgfzyz9Bm1X0LveDs9t
	oJnNwK8KoWJw5HWjoJntkdxBOqJkXgCI8AFm5Q9q0gBvl04Oi5v2vTVBwbNCoLCyZ3lixw
	AknZMl/RXzM00PwAIPPXOnDY6KjPL5U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-qcOln-XWPgGwVyjDW3qvcQ-1; Fri, 10 Feb 2023 17:59:35 -0500
X-MC-Unique: qcOln-XWPgGwVyjDW3qvcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF3A11869B6C;
	Fri, 10 Feb 2023 22:59:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C9BF1121315;
	Fri, 10 Feb 2023 22:59:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B03019465A3;
	Fri, 10 Feb 2023 22:59:28 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3DAA0194658F for <linux-audit@listman.corp.redhat.com>;
 Fri, 10 Feb 2023 22:59:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0738A492B00; Fri, 10 Feb 2023 22:59:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2CCC492C3F
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 22:59:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0F5B971082
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 22:59:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-0Hf7tdn3P92dqut8dXLXeA-1; Fri, 10 Feb 2023 17:59:23 -0500
X-MC-Unique: 0Hf7tdn3P92dqut8dXLXeA-1
Received: by mail-pj1-f43.google.com with SMTP id d2so6843199pjd.5
 for <linux-audit@redhat.com>; Fri, 10 Feb 2023 14:59:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8kv/mNjTYPXMVHJK/DKyXGFstxhwmOIHO4oCrQ/tx8=;
 b=uXp/cZVDWENYHfRTNic2PNBxCOLchZ4xktEWVYASEJp9KjJFZZJdlMJs38GbobHUfh
 TZ011juZimCg4NiZoJYWLITvw+De9DknUe/l7dnv7xOQVZ1rzf3gLNRIQis3dx7BZi0o
 yo/HU7XZlvqbAnO7r3/qbeFxUGuh6a4u4b9It600/8VC5Q2a1f6cVISxA24rTEeVjsIw
 ECT8zwVuWicX0tuNEoWZyhmIxZWJOMSPrQAGMzP3XmBcunz0o3+AYazkPmhxXoe7c6PN
 gfzo6DSN3qmvn4hKXbT5f2WR6DKdZWgpRJQQCYx5fKt7ITREq3WEsSBu8cLNzjhAmsFI
 HF0w==
X-Gm-Message-State: AO0yUKWdjNPYv07BF3SK097FoN6hrh7ivW707tt9g0s/7M9vE2qQixLz
 ltmDjQU6Qo1fPC5XeTS9vR8No25G6oolb7RjjYTI
X-Google-Smtp-Source: AK7set+Mc0q2UHVVlNVCV9n9vNCPsMk1+S+j3kC3bdm5GMoXKS42jBiWiE3EFNPPxmg10pAs3ilKKYyir3CF2JJWRQE=
X-Received: by 2002:a17:90a:4f85:b0:22c:41c7:c7ed with SMTP id
 q5-20020a17090a4f8500b0022c41c7c7edmr3000314pjh.61.1676069962079; Fri, 10 Feb
 2023 14:59:22 -0800 (PST)
MIME-Version: 1.0
References: <b5dfdcd541115c86dbc774aa9dd502c964849c5f.1675282642.git.rgb@redhat.com>
 <Y+VrSLZKZoAGikUS@madcap2.tricolour.ca>
 <CAHC9VhTNb4gOpk9=49-ABtYs1DFKqqwXPSc-2bhJX7wcZ82o=g@mail.gmail.com>
 <13293926.uLZWGnKmhe@x2> <6939adfb-ce2c-1911-19ee-af32f7d9a5ca@kernel.dk>
 <CAHC9VhTGmGJ81M2CZWsTf1kNf8XNz2WsYFAP=5VAVSUfUiu1yQ@mail.gmail.com>
 <56ef99e4-f9de-0634-ce53-3bc2f1fa6665@kernel.dk>
 <CAHC9VhSgSREUDzJfDq9H_VAbyCZBYakhE19OiUB19QCeEM3q2A@mail.gmail.com>
 <Y+a+hBtDwAXBgjsg@madcap2.tricolour.ca>
In-Reply-To: <Y+a+hBtDwAXBgjsg@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 10 Feb 2023 17:59:10 -0500
Message-ID: <CAHC9VhTdJvUQNNcNRFdrx7FAvw__r5jZMzpcO4uzRKS1VqBt_g@mail.gmail.com>
Subject: Re: [PATCH v2] io_uring,audit: don't log IORING_OP_MADVISE
To: Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux-Audit Mailing List <linux-audit@redhat.com>, Stefan Roesch <shr@fb.com>,
 Eric Paris <eparis@parisplace.org>, io-uring@vger.kernel.org
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 10, 2023 at 5:00 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2023-02-10 11:52, Paul Moore wrote:
> > On Fri, Feb 10, 2023 at 11:00 AM Jens Axboe <axboe@kernel.dk> wrote:
> > > On 2/10/23 8:39?AM, Paul Moore wrote:
> > > > On Thu, Feb 9, 2023 at 7:15 PM Jens Axboe <axboe@kernel.dk> wrote:
> > > >> On 2/9/23 3:54?PM, Steve Grubb wrote:
> > > >>> On Thursday, February 9, 2023 5:37:22 PM EST Paul Moore wrote:
> > > >>>> On Thu, Feb 9, 2023 at 4:53 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > >>>>> On 2023-02-01 16:18, Paul Moore wrote:
> > > >>>>>> On Wed, Feb 1, 2023 at 3:34 PM Richard Guy Briggs <rgb@redhat.com>
> > > >>> wrote:
> > > >>>>>>> fadvise and madvise both provide hints for caching or access pattern
> > > >>>>>>> for file and memory respectively.  Skip them.
> > > >>>>>>
> > > >>>>>> You forgot to update the first sentence in the commit description :/
> > > >>>>>
> > > >>>>> I didn't forget.  I updated that sentence to reflect the fact that the
> > > >>>>> two should be treated similarly rather than differently.
> > > >>>>
> > > >>>> Ooookay.  Can we at least agree that the commit description should be
> > > >>>> rephrased to make it clear that the patch only adjusts madvise?  Right
> > > >>>> now I read the commit description and it sounds like you are adjusting
> > > >>>> the behavior for both fadvise and madvise in this patch, which is not
> > > >>>> true.
> > > >>>>
> > > >>>>>> I'm still looking for some type of statement that you've done some
> > > >>>>>> homework on the IORING_OP_MADVISE case to ensure that it doesn't end
> > > >>>>>> up calling into the LSM, see my previous emails on this.  I need more
> > > >>>>>> than "Steve told me to do this".
> > > >>>>>>
> > > >>>>>> I basically just want to see that some care and thought has gone into
> > > >>>>>> this patch to verify it is correct and good.
> > > >>>>>
> > > >>>>> Steve suggested I look into a number of iouring ops.  I looked at the
> > > >>>>> description code and agreed that it wasn't necessary to audit madvise.
> > > >>>>> The rationale for fadvise was detemined to have been conflated with
> > > >>>>> fallocate and subsequently dropped.  Steve also suggested a number of
> > > >>>>> others and after investigation I decided that their current state was
> > > >>>>> correct.  *getxattr you've advised against, so it was dropped.  It
> > > >>>>> appears fewer modifications were necessary than originally suspected.
> > > >>>>
> > > >>>> My concern is that three of the four changes you initially proposed
> > > >>>> were rejected, which gives me pause about the fourth.  You mention
> > > >>>> that based on your reading of madvise's description you feel auditing
> > > >>>> isn't necessary - and you may be right - but based on our experience
> > > >>>> so far with this patchset I would like to hear that you have properly
> > > >>>> investigated all of the madvise code paths, and I would like that in
> > > >>>> the commit description.
> > > >>>
> > > >>> I think you're being unnecessarily hard on this. Yes, the commit message
> > > >>> might be touched up. But madvise is advisory in nature. It is not security
> > > >>> relevant. And a grep through the security directory doesn't turn up any
> > > >>> hooks.
> > > >>
> > > >> Agree, it's getting a bit anal... FWIW, patch looks fine to me.
> > > >
> > > > Call it whatever you want, but the details are often important at this
> > > > level of code, and when I see a patch author pushing back on verifying
> > > > that their patch is correct it makes me very skeptical.
> > >
> > > Maybe it isn't intended, but the replies have generally had a pretty
> > > condescending tone to them. That's not the best way to engage folks, and
> > > may very well be why people just kind of give up on it. Nobody likes
> > > debating one-liners forever, particularly not if it isn't inviting.
> >
> > I appreciate that you are coming from a different space, but I stand
> > by my comments.  Of course you are welcome to your own opinion, but I
> > would encourage you to spend some time reading the audit mail archives
> > going back a few years before you make comments like the above ... or
> > not, that's your call; I recognize it is usually easier to criticize.
> >
> > On a quasi related note to the list/archives: unfortunately there was
> > continued resistance to opening up the linux-audit list so I've setup
> > audit@vger for upstream audit kernel work moving forward.  The list
> > address in MAINTAINERS will get updated during the next merge window
> > so hopefully some of the problems you had in the beginning of this
> > discussion will be better in the future.
> >
> > > > I really would have preferred that you held off from merging this
> > > > until this was resolved and ACK'd ... oh well.
> > >
> > > It's still top of tree. If you want to ack it, let me know and I'll add
> > > it. If you want to nak it, give me something concrete to work off of.
> >
> > I can't in good conscience ACK it without some comment from Richard
> > that he has traced the code paths; this shouldn't be surprising at
> > this point.  I'm not going to NACK it or post a revert, I would have
> > done that already if I felt that was appropriate.  Right now this
> > patch is in a gray area for me in that I suspect it is good, but I
> > can't ACK it without some comment that it has been properly
> > researched.
>
> I feel a bit silly replying in this thread.  My dad claims that I need
> to have the last word in any argument, so that way he gets it instead...
>
> I appear to have accidentally omitted the connector word "and" between
> "description" and "code" above, which may have led you to doubt I had
> gone back and re-looked at the code.

Okay, as long as you've done the homework on this I'm good.  If it's
still on the top of Jen's tree, here's my ACK:

Acked-by: Paul Moore <paul@paul-moore.com>

... if it's not on top of the tree, it's not worth popping patches to
add the ACK IMHO.

Feel free to reply to this Richard if you want to have the last word
in this thread, I think I'm done ;)

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

