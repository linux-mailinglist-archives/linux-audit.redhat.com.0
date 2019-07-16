Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E96B130
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 23:39:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4852C307D96D;
	Tue, 16 Jul 2019 21:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5935C231;
	Tue, 16 Jul 2019 21:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3DBE1800207;
	Tue, 16 Jul 2019 21:39:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GLdcd1023559 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 17:39:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 202445DAAC; Tue, 16 Jul 2019 21:39:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4A35D96F
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 21:39:33 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A36F30B9BF7
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 21:39:32 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r15so9935962lfm.11
	for <linux-audit@redhat.com>; Tue, 16 Jul 2019 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UEoPNCG4kcJsbXvvedTVI/oUGPgfgDGC69R8YkpN0Ls=;
	b=E/8ikrwAfufbeGPzCfXxpn5EWxAfgLdy6LHVoRbFXYE9RhSrT+fCW/Ym0WBFnLVgpW
	6eknLnGyCQrub7C+oH2iB/3f89aqw/gEyuWoo9sMXXD1lgoKI/evg2UIhXk69H2wbB8W
	gBxoGQuij1gb1iyR95rQw/C8tqo7SbwCJcSPs2g6BA53k9qfo3IoqUoApxcsPMMsLYs+
	fbB5qmrjBhLFCO4IrMKKA++ei7tfjIrtjqwlLB9q9YGyuC3urVN/8I/CF1zxnWHvLmkT
	JHSkdhSFe+zled5GOpaKiAju6oSKwU0EPnFIWV879EhYNYZt26KZKzjjM+atv4cMxtPQ
	ZcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UEoPNCG4kcJsbXvvedTVI/oUGPgfgDGC69R8YkpN0Ls=;
	b=HRYtg3qnZ2mxPNIb+ztaK38NGBGIHOdQtGeRgwZlmD93LlVdQ2iBhoUaPHJXDVYdjI
	u2hVJ3um2ROjqtyb9p9FStrokhAUvgfl2a2+4PMfRYydt+1vseWpCbQC9+haYX4uojWR
	EGorJrOdxQXqBsbD4NPLbdJzxsr5ttf7VunF75t4JeoVzZxu8Y1B7dnx6w7gcBpkjHr9
	7naFK499VuopPdQHgbMq9iPy00n0Wk4s1mwX7kDg54j+BS5gZsTeJW4H/5WaExDiR5CO
	ICfJpw5/gNViyF/guixS4LXD/M4ymxFfMgBa5SXknmO2Cu0hDcmYtzBE7Dxsef57Vs+p
	VVsw==
X-Gm-Message-State: APjAAAV0cdZZ9z52qqCNYvoL4g4QhIUXxVSYPeTKRA/JXyHOkvUJn/T+
	OL1Ci1F38KmpFuNyWmJEGA+oGCdR1kPbJkL+Ig==
X-Google-Smtp-Source: APXvYqxVWwwG619v+YKQRDGT+YX+qm23m31n4KUpCUeLscpXJaA+UAUtNCEiDZTilTsw6kcSugeGwveeG28ePWlfYQw=
X-Received: by 2002:a19:8093:: with SMTP id
	b141mr16328818lfd.137.1563313170619; 
	Tue, 16 Jul 2019 14:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<9edad39c40671fb53f28d76862304cc2647029c6.1554732921.git.rgb@redhat.com>
	<20190529145742.GA8959@cisco>
	<CAHC9VhR4fudQanvZGYWMvCf7k2CU3q7e7n1Pi7hzC3v_zpVEdw@mail.gmail.com>
	<20190708175105.7zb6mikjw2wmnwln@madcap2.tricolour.ca>
	<CAHC9VhRFeCFSCn=m6wgDK2tXBN1euc2+bw8o=CfNwptk8t=j7A@mail.gmail.com>
	<20190716193828.xvm67iv5jyypvvxp@madcap2.tricolour.ca>
In-Reply-To: <20190716193828.xvm67iv5jyypvvxp@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 16 Jul 2019 17:39:19 -0400
Message-ID: <CAHC9VhTFW44gMMey8NnJzAeVxObwKhTgXcnt09q-7DtkFUiMCA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 21:39:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 16 Jul 2019 21:39:32 +0000 (UTC) for IP:'209.85.167.68'
	DOMAIN:'mail-lf1-f68.google.com' HELO:'mail-lf1-f68.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.68 mail-lf1-f68.google.com 209.85.167.68
	mail-lf1-f68.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-audit@redhat.com
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 16 Jul 2019 21:39:48 +0000 (UTC)

On Tue, Jul 16, 2019 at 3:38 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-07-15 16:38, Paul Moore wrote:
> > On Mon, Jul 8, 2019 at 1:51 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2019-05-29 11:29, Paul Moore wrote:
> >
> > ...
> >
> > > > The idea is that only container orchestrators should be able to
> > > > set/modify the audit container ID, and since setting the audit
> > > > container ID can have a significant effect on the records captured
> > > > (and their routing to multiple daemons when we get there) modifying
> > > > the audit container ID is akin to modifying the audit configuration
> > > > which is why it is gated by CAP_AUDIT_CONTROL.  The current thinking
> > > > is that you would only change the audit container ID from one
> > > > set/inherited value to another if you were nesting containers, in
> > > > which case the nested container orchestrator would need to be granted
> > > > CAP_AUDIT_CONTROL (which everyone to date seems to agree is a workable
> > > > compromise).  We did consider allowing for a chain of nested audit
> > > > container IDs, but the implications of doing so are significant
> > > > (implementation mess, runtime cost, etc.) so we are leaving that out
> > > > of this effort.
> > >
> > > We had previously discussed the idea of restricting
> > > orchestrators/engines from only being able to set the audit container
> > > identifier on their own descendants, but it was discarded.  I've added a
> > > check to ensure this is now enforced.
> >
> > When we weren't allowing nested orchestrators it wasn't necessary, but
> > with the move to support nesting I believe this will be a requirement.
> > We might also need/want to restrict audit container ID changes if a
> > descendant is acting as a container orchestrator and managing one or
> > more audit container IDs; although I'm less certain of the need for
> > this.
>
> I was of the opinion it was necessary before with single-layer parallel
> orchestrators/engines.

One of the many things we've disagreed on, but it doesn't really
matter at this point.

> > > I've also added a check to ensure that a process can't set its own audit
> > > container identifier ...
> >
> > What does this protect against, or what problem does this solve?
> > Considering how easy it is to fork/exec, it seems like this could be
> > trivially bypassed.
>
> Well, for starters, it would remove one layer of nesting.  It would
> separate the functional layers of processes.

This doesn't seem like something we need to protect against, what's
the harm?  My opinion at this point is that we should only add
restrictions to protect against problematic or dangerous situations; I
don't believe one extra layer of nesting counts as either.

Perhaps the container folks on the To/CC line can comment on this?  If
there is a valid reason for this restriction, great, let's do it,
otherwise it seems like an unnecessary hard coded policy to me.

> Other than that, it seems
> like a gut feeling that it is just wrong to allow it.  It seems like a
> layer violation that one container orchestrator/engine could set its own
> audit container identifier and then set its children as well.  It would
> be its own parent.

I suspect you are right that the current crop of container engines
won't do this, but who knows what we'll be doing with "containers" 5,
or even 10, years from now.  With that in mind, let me ask the
question again: is allowing an orchestrator the ability to set its own
audit container ID problematic and/or dangerous?

> It would make it harder to verify adherance to descendancy and inheritance rules.

The audit log should contain all the information needed to track that,
right?  If it doesn't, then I think we have a problem with the
information we are logging.  Right?

> > > ... and that if the identifier is already set, then the
> > > orchestrator/engine must be in a descendant user namespace from the
> > > orchestrator that set the previously inherited audit container
> > > identifier.
> >
> > You lost me here ... although I don't like the idea of relying on X
> > namespace inheritance for a hard coded policy on setting the audit
> > container ID; we've worked hard to keep this independent of any
> > definition of a "container" and it would sadden me greatly if we had
> > to go back on that.
>
> This would seem to be the one concession I'm reluctantly making to try
> to solve this nested container orchestrator/engine challenge.

As I said, you lost me on this - how does this help?  A more detailed
explanation of how this helps resolve the nesting problem would be
useful.

> Would backing off on that descendant user namespace requirement and only
> require that a nested audit container identifier only be permitted on a
> descendant task be sufficient?  It may for this use case, but I suspect
> not for additional audit daemons (we're not there yet) and message
> routing to those daemons.
>
> The one difference here is that it does not depend on this if the audit
> container identifier has not already been set.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
