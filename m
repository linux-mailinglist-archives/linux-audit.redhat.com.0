Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9C22E82C
	for <lists+linux-audit@lfdr.de>; Thu, 30 May 2019 00:27:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15E3859464;
	Wed, 29 May 2019 22:26:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 168E060BF0;
	Wed, 29 May 2019 22:26:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D59E1806B14;
	Wed, 29 May 2019 22:26:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4TMQZ20008077 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 29 May 2019 18:26:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 559A460C69; Wed, 29 May 2019 22:26:35 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50A3760C61
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:26:33 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 319AC7573D
	for <linux-audit@redhat.com>; Wed, 29 May 2019 22:26:25 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id w1so4144754ljw.0
	for <linux-audit@redhat.com>; Wed, 29 May 2019 15:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t49dJmETs8La1f+MwRhpaeRXNs8pwfNjtCbfGrPUmGI=;
	b=Ro1lwjJVVG+qfv2hVkkiiCmqyVjNxXb0ZoITXQy+P1f2GZdZ9qhO4d3e/bDxnsB4zf
	VG6lk1pc3YIXT+6MuBmXXRlQuiBjsm+UOieluWIzA1MVSrAXdvoECvq7uk6Ub9GjZF0B
	tVGRBNgcuJHEDdGzb+K4IrF0euqoyMFEdmTrJ2Q1yuusoIvJmvk9lwEm+0zz5SIuXOku
	jMMynjoocJl0WscdyzinFI3DjKPXAUNduIc5aIEfzMKre4ttNj5pz1w0j7LuWT9yXexH
	bwP0U65ZujtqZ8lmY/Xslf1D4oCvvWTWj42wkFXwRNsxqua0u6w+SRvpcMroFwi3QrQa
	JRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t49dJmETs8La1f+MwRhpaeRXNs8pwfNjtCbfGrPUmGI=;
	b=rsbZRyB4d0OJFCT0AhWQtm8VDkpCUf1fUTw1XDjeKpJNKum1OvaXpV0b+rWME5Raqc
	hBJ4c6QyoGTiHuBK+Rky0Thry6Io8qQrH3FSxxpNMZ9jSCLLATHL4H1X4230IbkeLnwi
	g1aHBKytAHp6sqq6sQKeZnXdLLlho3oOKvjX8h++OwceaqJX76s7rQA6GiuEXosrR7e2
	ERQVDxr7qTZSnkRzAbLIOshSVcSFmDEswsMIpEnBmVj8nrB07AcWL5w0J4LowN1Glff/
	3J2qxXmx2bOWuR2AM6wrpGUmjpVqVlZH2r6LjAbIfKvlmKBfZ8wE6/KKeuRQZ/coXd0t
	47IA==
X-Gm-Message-State: APjAAAWw8w3wfL/++vxvqZRFAjocWmiUOd8vW3I3+EvjLo84CG0l0C2P
	Dmhmf3HSLjxkPoO4ALaRFWheJ9aSkJSHYq/WR3CN
X-Google-Smtp-Source: APXvYqzXoX5W/MSRe7ZM1UFVUXZ7hVlI4/qUTd+yNc10f5h38uBnQFKctQEahIj0puMuN+Akyog1+YJ/gUbmGgqoReo=
X-Received: by 2002:a2e:9106:: with SMTP id m6mr145593ljg.164.1559168783453;
	Wed, 29 May 2019 15:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1554732921.git.rgb@redhat.com>
	<20190422113810.GA27747@hmswarspite.think-freely.org>
	<CAHC9VhQYPF2ma_W+hySbQtfTztf=K1LTFnxnyVK0y9VYxj-K=w@mail.gmail.com>
In-Reply-To: <CAHC9VhQYPF2ma_W+hySbQtfTztf=K1LTFnxnyVK0y9VYxj-K=w@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 29 May 2019 18:26:12 -0400
Message-ID: <CAHC9VhTQ0gDZoWUh1QB4b7h3AgbpkhS40jrPVpCfJb11GT_FzQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V6 00/10] audit: implement container identifier
To: Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 29 May 2019 22:26:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 29 May 2019 22:26:25 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: -0.315  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: Neil Horman <nhorman@tuxdriver.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 29 May 2019 22:27:07 +0000 (UTC)

On Mon, Apr 22, 2019 at 9:49 AM Paul Moore <paul@paul-moore.com> wrote:
> On Mon, Apr 22, 2019 at 7:38 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> > On Mon, Apr 08, 2019 at 11:39:07PM -0400, Richard Guy Briggs wrote:
> > > Implement kernel audit container identifier.
> >
> > I'm sorry, I've lost track of this, where have we landed on it? Are we good for
> > inclusion?
>
> I haven't finished going through this latest revision, but unless
> Richard made any significant changes outside of the feedback from the
> v5 patchset I'm guessing we are "close".
>
> Based on discussions Richard and I had some time ago, I have always
> envisioned the plan as being get the kernel patchset, tests, docs
> ready (which Richard has been doing) and then run the actual
> implemented API by the userland container folks, e.g. cri-o/lxc/etc.,
> to make sure the actual implementation is sane from their perspective.
> They've already seen the design, so I'm not expecting any real
> surprises here, but sometimes opinions change when they have actual
> code in front of them to play with and review.
>
> Beyond that, while the cri-o/lxc/etc. folks are looking it over,
> whatever additional testing we can do would be a big win.  I'm
> thinking I'll pull it into a separate branch in the audit tree
> (audit/working-container ?) and include that in my secnext kernels
> that I build/test on a regular basis; this is also a handy way to keep
> it based against the current audit/next branch.  If any changes are
> needed Richard can either chose to base those changes on audit/next or
> the separate audit container ID branch; that's up to him.  I've done
> this with other big changes in other trees, e.g. SELinux, and it has
> worked well to get some extra testing in and keep the patchset "merge
> ready" while others outside the subsystem look things over.

I just sent my feedback on the v6 patchset, and it's small: basically
three patches with "one-liner" changes needed.

Richard, it's your call on how you want to proceed from here.  You can
post a v7 incorporating the feedback, or since the tweaks are so
minor, you can post fixup patches; the former being more
comprehensive, the later being quicker to review and digest.
Regardless of that, while we are waiting on a prototype from the
container folks, I think it would be good to pull this into a working
branch in the audit repo (as mentioned above), unless you would prefer
to keep it as a patchset on the mailing list?  If you want to go with
the working branch approach, I'll keep the branch fresh and (re)based
against audit/next and if we notice any problems you can just submit
fixes against that branch (depending on the issue they can be fixup
patches, or proper patches).  My hope is that this will enable the
process to move quicker as we get near the finish line.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
