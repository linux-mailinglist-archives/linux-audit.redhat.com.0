Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 936216AE22
	for <lists+linux-audit@lfdr.de>; Tue, 16 Jul 2019 20:06:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A572B88317;
	Tue, 16 Jul 2019 18:06:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F41544ED;
	Tue, 16 Jul 2019 18:06:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE7E1972D;
	Tue, 16 Jul 2019 18:06:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GI6Y4u016531 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 14:06:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6F721D9; Tue, 16 Jul 2019 18:06:34 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from x2.localnet (ovpn-116-76.phx2.redhat.com [10.3.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5D8A60A9F;
	Tue, 16 Jul 2019 18:06:27 +0000 (UTC)
From: Steve Grubb <sgrubb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: Preferred subj= with multiple LSMs
Date: Tue, 16 Jul 2019 14:06:27 -0400
Message-ID: <2477603.130G60v5SE@x2>
Organization: Red Hat
In-Reply-To: <CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<c993f63a-7c2d-c6c8-cfa6-3cfba410770d@schaufler-ca.com>
	<CAHC9VhSTwvueKcK2yhckwayh9YGou7gt2Gny36DOTaNkrck+Mg@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Tue, 16 Jul 2019 18:06:42 +0000 (UTC)

On Tuesday, July 16, 2019 1:43:18 PM EDT Paul Moore wrote:
> On Tue, Jul 16, 2019 at 1:30 PM Casey Schaufler <casey@schaufler-ca.com> 
wrote:
> > On 7/16/2019 10:12 AM, Paul Moore wrote:
> > > On Mon, Jul 15, 2019 at 6:56 PM Steve Grubb <sgrubb@redhat.com> wrote:
> > >> On Monday, July 15, 2019 5:28:56 PM EDT Paul Moore wrote:
> > >>> On Mon, Jul 15, 2019 at 3:37 PM Casey Schaufler
> > >>> <casey@schaufler-ca.com>
> > >> 
> > >> wrote:
> > >>>> On 7/15/2019 12:04 PM, Richard Guy Briggs wrote:
> > >>>>> On 2019-07-13 11:08, Steve Grubb wrote:
> > > ...
> > > 
> > >>>>> Steve's answer is the obvious one, ideally allocating a seperate
> > >>>>> range
> > >>>>> to each LSM with each message type having its own well defined
> > >>>>> format.
> > >>>> 
> > >>>> It doesn't address the issue of success records, or records
> > >>>> generated outside the security modules.
> > >>> 
> > >>> Yes, exactly.  The individual LSM will presumably will continue to
> > >>> generate their own audit records as they do today and I would imagine
> > >>> that the subject and object fields could remain as they do today for
> > >>> the LSM specific records.
> > >>> 
> > >>> The trick is the other records which are not LSM specific but still
> > >>> want to include subject and/or object information.  Unfortunately we
> > >>> are stuck with some tough limitations given the current audit record
> > >>> format and Steve's audit userspace tools;
> > >> 
> > >> Not really. We just need to approach the problem thinking about how to
> > >> make it work based on how things currently work.
> > > 
> > > I suppose it is all somewhat "subjective" - bad joke fully intended :)
> > > - with respect to what one considers good/bad/limiting.  My personal
> > > view is that an ideal solution would allow for multiple independent
> > > subj/obj labels without having to multiplex on a single subj/obj
> > > field.  My gut feeling is that this would confuse your tools, yes?
> > > 
> > >> For example Casey had a list of possible formats. Like this one:
> > >> 
> > >> Option 3:
> > >>         lsms=selinux,apparmor subj=x:y:z:s:c subj=a
> > >> 
> > >> I'd suggest something almost like that. The first field could be a map
> > >> to
> > >> decipher the labels. Then we could have a comma separated list of
> > >> labels.
> > >> 
> > >> lsms=selinux,apparmor subj=x:y:z:s:c,a
> > > 
> > > Some quick comments:
> > > 
> > > * My usual reminder that new fields for existing audit records must be
> > > added to the end of the record.
> > > 
> > > * If we are going to multiplex the labels on a single field (more on
> > > that below) I might suggest using "subj_lsms" instead of "lsms" so we
> > > leave ourself some wiggle room in the future.
> > > 
> > > * Multiplexing on a single "subj" field is going to be difficult
> > > because picking the label delimiter is going to be a pain.  For
> > > example, in the example above a comma is used, which at the very least
> > > is a valid part of a SELinux label and I suspect for Smack as well
> > > (I'm not sure about the other LSMs).  I suspect the only way to parse
> > > out the component labels would be to have knowledge of the LSMs in
> > > use, as well as the policies loaded at the time the audit record was
> > > generated.
> > > 
> > > This may be a faulty assumption, but assuming your tools will fall
> > > over if they see multiple "subj" fields, could we do something like
> > > 
> > > the following (something between option #2 and #3):
> > >   subj1_lsm=smack subj1=<smack_label> subj2_lsm=selinux
> > > 
> > > subj2=<selinux_label> ...
> > 
> > If it's not a subj= field why use the indirection?
> > 
> >         subj_smack=<smack_label> subj_selinux=<selinux_label>
> > 
> > would be easier.
> 
> Good point, that looks reasonable to me.

But doing something like this will totally break all parsers. To be honest, I 
don't know if I'll ever see more than one labeled security system running at 
the same time. And this would be a big penalty to pay for the flexibility that 
someone, somewhere just might possibly do this.

-Steve



--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
