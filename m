Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D126E8B5
	for <lists+linux-audit@lfdr.de>; Fri, 19 Jul 2019 18:25:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0D4A7FDE5;
	Fri, 19 Jul 2019 16:25:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6384C46466;
	Fri, 19 Jul 2019 16:25:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE141800208;
	Fri, 19 Jul 2019 16:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JG0wpD030522 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 12:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF44B5C226; Fri, 19 Jul 2019 16:00:58 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 229075C25D;
	Fri, 19 Jul 2019 16:00:52 +0000 (UTC)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EE4AA3B4E;
	Fri, 19 Jul 2019 16:00:51 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52])
	by out01.mta.xmission.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1hoVJR-0000DQ-Q5; Fri, 19 Jul 2019 10:00:49 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]
	helo=x220.xmission.com) by in02.mta.xmission.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.87)
	(envelope-from <ebiederm@xmission.com>)
	id 1hoVJF-00007t-01; Fri, 19 Jul 2019 10:00:49 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Paul Moore <paul@paul-moore.com>
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
	<CAHC9VhTYV02ws3QcezER5cY+Xt+tExcJEO-dumTDx=FXGFh3nw@mail.gmail.com>
Date: Fri, 19 Jul 2019 11:00:24 -0500
In-Reply-To: <CAHC9VhTYV02ws3QcezER5cY+Xt+tExcJEO-dumTDx=FXGFh3nw@mail.gmail.com>
	(Paul Moore's message of "Thu, 18 Jul 2019 17:52:58 -0400")
Message-ID: <87muhadnfr.fsf@xmission.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1hoVJF-00007t-01; ; ; mid=<87muhadnfr.fsf@xmission.com>; ; ;
	hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ;
	frm=ebiederm@xmission.com; ; ; spf=neutral
X-XM-AID: U2FsdGVkX18MlRZOnz5KekqSTfqL1FafpgF6dgr4Jq4=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
	DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG autolearn=disabled
	version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4999]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Paul Moore <paul@paul-moore.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 12445 ms - load_scoreonly_sql: 0.07 (0.0%),
	signal_user_changed: 3.0 (0.0%), b_tie_ro: 2.0 (0.0%), parse: 1.79
	(0.0%), extract_message_metadata: 20 (0.2%), get_uri_detail_list: 3.3
	(0.0%), tests_pri_-1000: 13 (0.1%), tests_pri_-950: 1.51 (0.0%),
	tests_pri_-900: 1.26 (0.0%), tests_pri_-90: 34 (0.3%), check_bayes: 31
	(0.3%), b_tokenize: 10 (0.1%), b_tok_get_all: 9 (0.1%), b_comp_prob: 6
	(0.0%), b_tok_touch_all: 2.6 (0.0%), b_finish: 0.85 (0.0%),
	tests_pri_0: 380 (3.1%), check_dkim_signature: 1.03 (0.0%),
	check_dkim_adsp: 3.3 (0.0%), poll_dns_idle: 11972 (96.2%),
	tests_pri_10: 2.1 (0.0%), tests_pri_500: 11982 (96.3%), rewrite_mail:
	0.00 (0.0%)
Subject: Re: [PATCH ghak90 V6 02/10] audit: add container id
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Fri, 19 Jul 2019 16:00:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 19 Jul 2019 16:00:51 +0000 (UTC) for IP:'166.70.13.231'
	DOMAIN:'out01.mta.xmission.com' HELO:'out01.mta.xmission.com'
	FROM:'ebiederm@xmission.com' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 166.70.13.231 out01.mta.xmission.com
	166.70.13.231 out01.mta.xmission.com <ebiederm@xmission.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Fri, 19 Jul 2019 12:24:53 -0400
Cc: Tycho Andersen <tycho@tycho.ws>, nhorman@tuxdriver.com,
	Richard Guy Briggs <rgb@redhat.com>, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 19 Jul 2019 16:25:03 +0000 (UTC)

Paul Moore <paul@paul-moore.com> writes:

> On Wed, Jul 17, 2019 at 8:52 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>> On 2019-07-16 19:30, Paul Moore wrote:
>
> ...
>
>> > We can trust capable(CAP_AUDIT_CONTROL) for enforcing audit container
>> > ID policy, we can not trust ns_capable(CAP_AUDIT_CONTROL).
>>
>> Ok.  So does a process in a non-init user namespace have two (or more)
>> sets of capabilities stored in creds, one in the init_user_ns, and one
>> in current_user_ns?  Or does it get stripped of all its capabilities in
>> init_user_ns once it has its own set in current_user_ns?  If the former,
>> then we can use capable().  If the latter, we need another mechanism, as
>> you have suggested might be needed.
>
> Unfortunately I think the problem is that ultimately we need to allow
> any container orchestrator that has been given privileges to manage
> the audit container ID to also grant that privilege to any of the
> child process/containers it manages.  I don't believe we can do that
> with capabilities based on the code I've looked at, and the
> discussions I've had, but if you find a way I would leave to hear it.

>> If some random unprivileged user wants to fire up a container
>> orchestrator/engine in his own user namespace, then audit needs to be
>> namespaced.  Can we safely discard this scenario for now?
>
> I think the only time we want to allow a container orchestrator to
> manage the audit container ID is if it has been granted that privilege
> by someone who has that privilege already.  In the zero-container, or
> single-level of containers, case this is relatively easy, and we can
> accomplish it using CAP_AUDIT_CONTROL as the privilege.  If we start
> nesting container orchestrators it becomes more complicated as we need
> to be able to support granting and inheriting this privilege in a
> manner; this is why I suggested a new mechanism *may* be necessary.


Let me segway a bit and see if I can get this conversation out of the
rut it seems to have drifted into.

Unprivileged containers and nested containers exist today and are going
to become increasingly common.  Let that be a given.

As I recall the interesting thing for audit to log is actions by
privileged processes.  Audit can log more but generally configuring
logging by of the actions of unprivileged users is effectively a self
DOS.

So I think the initial implementation can safely ignore actions of
nested containers and unprivileged containers because you don't care
about their actions. 

If we start allow running audit in a container then we need to deal with
all of the nesting issues but until then I don't think you folks care.

Or am I wrong.  Do the requirements for securely auditing things from
the kernel care about the actions of unprivileged users?

Eric

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
