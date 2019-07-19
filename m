Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA166E831
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jul 2019 17:48:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8973821C7;
	Fri, 19 Jul 2019 15:48:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4485DA38;
	Fri, 19 Jul 2019 15:47:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BADA1800206;
	Fri, 19 Jul 2019 15:47:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JFWgfH025905 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 11:32:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDDDB10027BE; Fri, 19 Jul 2019 15:32:42 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB19E1001B32;
	Fri, 19 Jul 2019 15:32:33 +0000 (UTC)
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34C3530C1E1F;
	Fri, 19 Jul 2019 15:32:32 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51])
	by out03.mta.xmission.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1hoUs1-0002I0-Fb; Fri, 19 Jul 2019 09:32:29 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in01.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1hoUs0-0005zu-CO; Fri, 19 Jul 2019 09:32:29 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Richard Guy Briggs <rgb@redhat.com>
References: <20190529153427.GB8959@cisco>
	<CAHC9VhSF3AjErX37+eeusJ7+XRw8yuPsmqBTRwc9EVoRBh_3Tw@mail.gmail.com>
	<20190529222835.GD8959@cisco>
	<CAHC9VhRS66VGtug3fq3RTGHDvfGmBJG6yRJ+iMxm3cxnNF-zJw@mail.gmail.com>
	<20190530170913.GA16722@mail.hallyn.com>
	<CAHC9VhThLiQzGYRUWmSuVfOC6QCDmA75BDB7Eg7V8HX4x7ymQg@mail.gmail.com>
	<20190708180558.5bar6ripag3sdadl@madcap2.tricolour.ca>
	<CAHC9VhRTT7JWqNnynvK04wKerjc-3UJ6R1uPtjCAPVr_tW-7MA@mail.gmail.com>
	<20190716220320.sotbfqplgdructg7@madcap2.tricolour.ca>
	<CAHC9VhScHizB2r5q3T5s0P3jkYdvzBPPudDksosYFp_TO7W9-Q@mail.gmail.com>
	<20190718005145.eshekqfr3navqqiy@madcap2.tricolour.ca>
Date: Fri, 19 Jul 2019 10:32:13 -0500
In-Reply-To: <20190718005145.eshekqfr3navqqiy@madcap2.tricolour.ca> (Richard
	Guy Briggs's message of "Wed, 17 Jul 2019 20:51:45 -0400")
Message-ID: <874l3ighvm.fsf@xmission.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1hoUs0-0005zu-CO; ; ; mid=<874l3ighvm.fsf@xmission.com>; ; ;
	hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+51FYWsW8BRSUlMyR1nWn6IFnz4uCKOTQ=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG autolearn=disabled
	version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Richard Guy Briggs <rgb@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 656 ms - load_scoreonly_sql: 0.06 (0.0%),
	signal_user_changed: 2.9 (0.4%), b_tie_ro: 1.94 (0.3%), parse: 0.88
	(0.1%), extract_message_metadata: 3.3 (0.5%), get_uri_detail_list:
	1.18 (0.2%), tests_pri_-1000: 7 (1.0%), tests_pri_-950: 1.56 (0.2%),
	tests_pri_-900: 1.50 (0.2%), tests_pri_-90: 23 (3.6%), check_bayes: 22
	(3.3%), b_tokenize: 7 (1.1%), b_tok_get_all: 6 (0.9%), b_comp_prob:
	1.93 (0.3%), b_tok_touch_all: 4.5 (0.7%), b_finish: 0.60 (0.1%),
	tests_pri_0: 598 (91.1%), check_dkim_signature: 0.56 (0.1%),
	check_dkim_adsp: 2.2 (0.3%), poll_dns_idle: 0.60 (0.1%), tests_pri_10:
	2.2 (0.3%), tests_pri_500: 6 (0.9%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.47]); Fri, 19 Jul 2019 15:32:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 19 Jul 2019 15:32:33 +0000 (UTC) for IP:'166.70.13.233'
	DOMAIN:'out03.mta.xmission.com' HELO:'out03.mta.xmission.com'
	FROM:'ebiederm@xmission.com' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 166.70.13.233 out03.mta.xmission.com
	166.70.13.233 out03.mta.xmission.com <ebiederm@xmission.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 11:46:48 -0400
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, simo@redhat.com,
	netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, "Serge E. Hallyn" <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 19 Jul 2019 15:48:05 +0000 (UTC)

Richard Guy Briggs <rgb@redhat.com> writes:

> On 2019-07-16 19:30, Paul Moore wrote:
>> On Tue, Jul 16, 2019 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> > On 2019-07-15 17:04, Paul Moore wrote:
>> > > On Mon, Jul 8, 2019 at 2:06 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> 
>> > > > At this point I would say we are at an impasse unless we trust
>> > > > ns_capable() or we implement audit namespaces.
>> > >
>> > > I'm not sure how we can trust ns_capable(), but if you can think of a
>> > > way I would love to hear it.  I'm also not sure how namespacing audit
>> > > is helpful (see my above comments), but if you think it is please
>> > > explain.
>> >
>> > So if we are not namespacing, why do we not trust capabilities?
>> 
>> We can trust capable(CAP_AUDIT_CONTROL) for enforcing audit container
>> ID policy, we can not trust ns_capable(CAP_AUDIT_CONTROL).
>
> Ok.  So does a process in a non-init user namespace have two (or more)
> sets of capabilities stored in creds, one in the init_user_ns, and one
> in current_user_ns?  Or does it get stripped of all its capabilities in
> init_user_ns once it has its own set in current_user_ns?  If the former,
> then we can use capable().  If the latter, we need another mechanism, as
> you have suggested might be needed.

The latter.  There is only one set of capabilities and it is in the
processes current user namespace.

Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
