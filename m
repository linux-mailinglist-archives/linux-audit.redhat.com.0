Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4518321E4B6
	for <lists+linux-audit@lfdr.de>; Tue, 14 Jul 2020 02:45:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-o-1ke_BsNTuc3EJIFg9NuA-1; Mon, 13 Jul 2020 20:45:34 -0400
X-MC-Unique: o-1ke_BsNTuc3EJIFg9NuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A25C08027E3;
	Tue, 14 Jul 2020 00:45:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8C441C4;
	Tue, 14 Jul 2020 00:45:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E20A180954D;
	Tue, 14 Jul 2020 00:45:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06E0jFOs024832 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 20:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E1632156A50; Tue, 14 Jul 2020 00:45:15 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581712156A4D
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0979B92490A
	for <linux-audit@redhat.com>; Tue, 14 Jul 2020 00:45:13 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-344-mG5az6fmNduKIQeuAabdZg-1; Mon, 13 Jul 2020 20:45:10 -0400
X-MC-Unique: mG5az6fmNduKIQeuAabdZg-1
Received: by mail-ed1-f68.google.com with SMTP id dg28so15406647edb.3
	for <linux-audit@redhat.com>; Mon, 13 Jul 2020 17:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bmkyDT2Ok5AKFPTzejs90EKhv0LPiFP9AWMW7s63JrQ=;
	b=rlt9dqFlPm6j7hTp6BBd4jU7rOweLRhxPO2P6XGMWfW1PajFton44txbOykvdfBHMU
	xvSFs7Nh8g0uyVlEAcYGOTn+GREIuThAYo9Sq2Y5ksc5fmDuc+JFHIIqzaMfEa5w85++
	XHsesQK0pP1UH1iO7B7r+0JR1H25xpW6npmssKAYwtctHTjZSWiJ1CHoe2TY3brV6LLu
	nwALzsxulYTex9waXbXRwZ58/V02Sh1l9KvWHY7ttIimmqOJ+p93YwpjloTNT+g+scUM
	nK5h5kl6yVzAIhkuwvD3JX+R9GNkwh/3aWsPD47LoYe0zEuHQWpZo84lpq4uIIz3CZhn
	Jp3Q==
X-Gm-Message-State: AOAM530o8L4gFqCD3lH4z/zd4rH1tXEizvWMChTU0g/zfrg4UJxTLs99
	+xGIRDX7VIUcH+6lOV3RZDGkzFpwFX/eYhBiklYq
X-Google-Smtp-Source: ABdhPJxFM46eZkco0XOaaCsFFTHlrOfIfbbkJNmhbdNiqdLTCYkgzE1EAejSD/O9P/+a7qjfCVbCzfrxVpEC0f0mWgE=
X-Received: by 2002:a05:6402:1d89:: with SMTP id
	dk9mr1958150edb.31.1594687509148; 
	Mon, 13 Jul 2020 17:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593198710.git.rgb@redhat.com>
	<6abeb26e64489fc29b00c86b60b501c8b7316424.1593198710.git.rgb@redhat.com>
	<CAHC9VhTx=4879F1MSXg4=Xd1i5rhEtyam6CakQhy=_ZjGtTaMA@mail.gmail.com>
	<20200707025014.x33eyxbankw2fbww@madcap2.tricolour.ca>
	<CAHC9VhTTGLf9MPS_FgL1ibUVoH+YzMtPK6+2dp_j8a5o9fzftA@mail.gmail.com>
	<20200713202906.iiz435vjeedljcwf@madcap2.tricolour.ca>
In-Reply-To: <20200713202906.iiz435vjeedljcwf@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Jul 2020 20:44:57 -0400
Message-ID: <CAHC9VhScQAMeEXssDhDeAo+za9f-doqcM-yutDmFBuwqZVpa3A@mail.gmail.com>
Subject: Re: [PATCH ghak90 V9 01/13] audit: collect audit task parameters
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 13, 2020 at 4:30 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-07-07 21:42, Paul Moore wrote:
> > On Mon, Jul 6, 2020 at 10:50 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-07-05 11:09, Paul Moore wrote:
> > > > On Sat, Jun 27, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:

...

> > > > In the early days of this patchset we talked a lot about how to handle
> > > > the task_struct and the changes that would be necessary, ultimately
> > > > deciding that encapsulating all of the audit fields into an
> > > > audit_task_info struct.  However, what is puzzling me a bit at this
> > > > moment is why we are only including audit_task_info in task_info by
> > > > reference *and* making it a build time conditional (via CONFIG_AUDIT).
> > > >
> > > > If audit is enabled at build time it would seem that we are always
> > > > going to allocate an audit_task_info struct, so I have to wonder why
> > > > we don't simply embed it inside the task_info struct (similar to the
> > > > seccomp struct in the snippet above?  Of course the audit_context
> > > > struct needs to remain as is, I'm talking only about the
> > > > task_info/audit_task_info struct.
> > >
> > > I agree that including the audit_task_info struct in the struct
> > > task_struct would have been preferred to simplify allocation and free,
> > > but the reason it was included by reference instead was to make the
> > > task_struct size independent of audit so that future changes would not
> > > cause as many kABI challenges.  This first change will cause kABI
> > > challenges regardless, but it was future ones that we were trying to
> > > ease.
> > >
> > > Does that match with your recollection?
> >
> > I guess, sure.  I suppose what I was really asking was if we had a
> > "good" reason for not embedding the audit_task_info struct.
> > Regardless, thanks for the explanation, that was helpful.
>
> Making it dynamic was actually your idea back in the spring of 2018:
>         https://lkml.org/lkml/2018/4/18/759

If you read my comments from 2018 carefully, or even not so carefully
I think, you'll notice that my primary motivation for using a pointer
was to "hide" the audit_task_info struct contents so that they
couldn't be abused by other kernel subsystems looking for a general
container identifier inside the kernel.  As we've discussed many times
before, this patchset is not a general purpose container identifier,
this is an ***audit*** container ID; limiting the scope and usage of
this identifier is what has allowed us to gain the begrudging
acceptance we've had thus far and I believe it is the key to success.

For whatever it is worth, this patchset doesn't hide the
audit_task_struct definition in a kernel/audit*.c file, it lives in a
header file which is easily accessed by other subsystems.

In my opinion we should pick one of two options: leave it as a pointer
reference and "hide" the struct definition, or just embed the struct
and simplify the code.  I see little value in openly defining the
audit_task_info struct and using a pointer reference; if you believe
you have a valid argument for why this makes sense I'm open to hearing
it, but your comments thus far have been unconvincing.

> > > > Richard, I'm sure you can answer this off the top of your head, but
> > > > I'd have to go digging through the archives to pull out the relevant
> > > > discussions so I figured I would just ask you for a reminder ... ?  I
> > > > imagine it's also possible things have changed a bit since those early
> > > > discussions and the solution we arrived at then no longer makes as
> > > > much sense as it did before.
> > >
> > > Agreed, it doesn't make as much sense now as it did when proposed, but
> > > will make more sense in the future depending on when this change gets
> > > accepted upstream.  This is why I wanted this patch to go through as
> > > part of ghak81 at the time the rest of it did so that future kABI issues
> > > would be easier to handle, but that ship has long sailed.
> >
> > To be clear, kABI issues with task_struct really aren't an issue with
> > the upstream kernel.  I know that you know all of this already
> > Richard, I'm mostly talking to everyone else on the To/CC line in case
> > they are casually watching this discussion.
>
> kABI issues may not as much of an upstream issue, but part of the goal
> here was upstream kernel issues, isolating the kernel audit changes
> to its own subsystem and affect struct task_struct as little as possible
> in the future and to protect it from "abuse" (as you had expressed
> serious concerns) from the rest of the kernel.  include/linux/sched.h
> will need to know more about struct audit_task_info if it is embedded,
> making it more suceptible to abuse.

I define "abuse" in this context as other kernel subsystems inspecting
the contents of the audit_task_struct, most likely to try and
approximate a general container identifier.

Better separation between the audit subsystem and the task_struct,
while conceptually nice, isn't critical and is easily changed upstream
with each kernel release as it isn't part of the kernel/userspace API.
Regardless, a basic conceptual separation is achieved by the
audit_task_struct regardless of if it is embedded into the task_struct
or included by a pointer reference.

> > While I'm sympathetic to long-lifetime enterprise distros such as
> > RHEL, my responsibility is to ensure the upstream kernel is as good as
> > we can make it, and in this case I believe that means embedding
> > audit_task_info into the task_struct.
>
> Keeping audit_task_info dynamic will also make embedding struct
> audit_context as a zero-length array at the end of it possible in the
> future as an internal audit subsystem optimization whereas largely
> preclude that if it were embedded.

Predicting the future is hard, but I would be comfortable giving up on
a variable length audit_task_info struct.  Besides, if we *really* had
to do that in the future we could, it's not part of the
kernel/userspace API.

> This method has been well exercised over the last two years of
> development, testing and rebases, so I'm not particularly concerned
> about its dynamic nature any more.  It works well.  At this point this
> change seems to be more gratuitously disruptive than helpful.

It may not seem like it, but at this point in this patchset's life I
do try to limit my comments to only those things which I feel are
substantive.  In the cases where I think something is borderline I'll
mention that in my comments.  The trivial cases I'll generally call
out as "nitpicks".  I assure you my comments are not gratuitous.

I look forward to reviewing another round of this patchset about as
much as I expect you look forward to writing, testing, and submitting
it.

> > > > > diff --git a/kernel/auditsc.c b/kernel/auditsc.c
> > > > > index 468a23390457..f00c1da587ea 100644
> > > > > --- a/kernel/auditsc.c
> > > > > +++ b/kernel/auditsc.c
> > > > > @@ -1612,7 +1615,6 @@ void __audit_free(struct task_struct *tsk)
> > > > >                 if (context->current_state == AUDIT_RECORD_CONTEXT)
> > > > >                         audit_log_exit();
> > > > >         }
> > > > > -
> > > > >         audit_set_context(tsk, NULL);
> > > > >         audit_free_context(context);
> > > > >  }
> > > >
> > > > This nitpick is barely worth the time it is taking me to write this,
> > > > but the whitespace change above isn't strictly necessary.
> > >
> > > Sure, it is a harmless but noisy cleanup when the function was being
> > > cleaned up and renamed.  It wasn't an accident, but a style preference.
> > > Do you prefer a vertical space before cleanup actions at the end of
> > > functions and more versus less vertical whitespace in general?
> >
> > As I mentioned above, this really was barely worth mentioning, but I
> > made the comment simply because I feel this patchset is going to draw
> > a lot of attention once it is merged and I feel keeping the patchset
> > as small, and as focused, as possible is a good thing.
>
> Is this concern also affecting the perspective on the change from
> pointer to embedded above?

Keeping this particular patchset small and focused has always been a
goal; I know we talked about this at least once, likely more than
that, while I was still at RH and we were talking offline.

If something is going to be contentious, it is better to be small and
focused on the contention.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

